//
//  ViewModel.swift
//  Tuesday
//
//  Created by Ulysse Perret on 08/02/2022.
//
//Import
import Foundation
import Combine
import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
//View Model
class ViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    @Published var books = [Book]()
    
    var listener: ListenerRegistration?
    var subscription: AnyCancellable?
    //Initial value
    init() {
        //Subscritpion - connect
        subscription = $user.sink(receiveValue:
                                    { [weak self] user in
                                        self?.setListener(user: user)
        })
    }
}

// Firebase management
extension ViewModel {
    //Connect
    func login(mail: String, password: String) {
        Task {
            do {
                //Authentification
                let authResult = try await Auth.auth().signIn(withEmail: mail, password: password)
                errorMessage = .none
                user = authResult.user
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
    //Disconnect
    func logout() {
        do {
            try Auth.auth().signOut()
            errorMessage = .none
            user = .none
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    //Snapshot
    func snapshotListener(querySnapshot: QuerySnapshot?, error: Error?) {
        if let error = error {
            errorMessage = error.localizedDescription
        }
        
        if let documents = querySnapshot?.documents {
            print("Documents: \(documents)")
            do {
                books = try documents.compactMap({ document -> Book? in
                    let book = try document.data(as: Book.self)
                    return book
               })
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
    //Listen - for check information/ user
    func setListener(user: User?) {
        if let existingListener = listener {
            existingListener.remove()
            print("Existing listener removed")
            listener = .none
        }
        //check user 
        if let user = user {
            let collection = Firestore.firestore().collection("Bibliotheque")
            listener = collection.addSnapshotListener { [weak self] (querySnapshot, error) in
                self?.snapshotListener(querySnapshot: querySnapshot, error: error)
            }
            print("Listener added for \(user.uid)")
        }
    }
   
    /**Addbook
     Parameter : Book : le book qu'on veut crée
     Error: si cas on a un erreur (champ vide par exemple
     on fabrique un document à partir des données d'un book
     c'est a dire Inverse document, data à partir d'un book
     puis on l'ajoutera les données à cet collection
    **/
  //  @Published var book1:[Book1]! = []
    
    func AddBook(book: Book?, data:String) throws -> String {
        @EnvironmentObject var model: ViewModel
            
        /* ... check if entered data is ok */
        //var ref: DatabaseReference!
//ref = Database.database().reference()
        // Listen for new comments in the Firebase database
        /**
         commentsRef.observe(.childAdded, with: { (snapshot) -> Void in
           self.comments.append(snapshot)
           self.tableView.insertRows(
             at: [IndexPath(row: self.comments.count - 1, section: self.kSectionComments)],
             with: UITableView.RowAnimation.automatic
           )
         })
         */

        ForEach(books ) {
            book in
            Text(book.title ?? "Pas de titre")
                                }
        print("Book : \(book)")
        //List(model.books) { book in
       
        
        /**
        if let documents = querySnapshot?.documents {
            print("Documents: \(documents)")
            do {
                books = try documents.compactMap({ document -> Book? in
                    let book = try document.data(as: Book.self)
                    return book
               })
            } catch {
                errorMessage = error.localizedDescription
            }
        }  */
        
        return data
        //console.log(book)
    }
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
 
}
