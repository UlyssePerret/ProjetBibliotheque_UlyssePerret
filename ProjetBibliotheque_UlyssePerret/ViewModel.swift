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
    //COnnect
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
}
