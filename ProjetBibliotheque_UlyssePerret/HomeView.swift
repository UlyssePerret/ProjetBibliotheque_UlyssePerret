//
//  HomeView.swift
//  Tuesday
//
//  Created by Ulysse Perret on 08/02/2022.
//
//Page we see firt - Home
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ViewModel
  
    @State var showAddBook = false
    @State var showDeleteBook = false
    @StateObject var library  = Library()
    
    //Body
    var body: some View {
        VStack{
            //Cas User existe
            if let user = model.user{
               //For Welme - First view
                VStack {
                    //Welcome with Id
                    //Text("Bienvenue à toi , \(user.uid)")
                    Text("Welcome !")
                    List(model.books) { book in
                        let title = book.title ?? "No Title"
                        Text("Book: \(title)");
                    }
                    Text("Function possible : ");
                    //Button for additionnal
                    VStack {
                        Button("Add") {
                            showAddBook = true
                        }
                        
                    }.sheet(isPresented: $showAddBook) {
                        List(model.books) { book in
                        AddBookView(showAddBook: $showAddBook, title: book.title, genre : book.genre, language: book.language, publication_date: book.publication_date)
                    }
                    }
                    //Button for Delete
                    VStack {
                        Button("Delete") {
                            showDeleteBook = true
                        }
                    }.sheet(isPresented: $showDeleteBook) {
                        DeleteBook (showDeleteBook: $showDeleteBook)
                    }
                }
                //Cas User n'existe pas -> remet le login
            } else {
                LoginView()
            }
            //MEssage Erreur
            if let errorMessage = model.errorMessage{
                Text(errorMessage)
                    .padding()
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
    //Tentative pour delete
    func removeBooks(at offset: IndexSet){
      //  $library.books.remove(atOffsets: offset)
        
    }
}
 //Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

 //For Delete?
struct  DeleteBook: View {
    @Binding var showDeleteBook: Bool
    @EnvironmentObject var model: ViewModel
    var body: some View {
        VStack {
            Text("Book who wanted to Delete ")
                .padding()
            List(model.books) { book in
                let title = book.title ?? "No Title"
                Text("Delete: \(title) ?");
                Button("Yes") {
                    showDeleteBook = false
                    }
               
            }
            Button("Return") {
                 showDeleteBook = false
                }
         }
     }
}
 


