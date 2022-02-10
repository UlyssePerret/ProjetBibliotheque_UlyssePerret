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
    
    //BOdy
    var body: some View {
        VStack{
            //User
            if let user = model.user{
               
                VStack {
                    //Welcome with Id
                    //Text("Bienvenue à toi , \(user.uid)")
                    Text("Welcome !")
                    List(model.books) { book in
                        let title = book.title ?? "No Title"
                        Text("Book: \(title)");
                    }

                    NavigationView{
                        List{
                            ForEach(library.books, id: \.title){ book in
                                Text(book.title ?? "No Title");
                            }
                            .onDelete(perform: removeBooks)
                        }
                        .navigationTitle("iLibrary")
                        .toolbar {
                            Button {
                                let books = Book  ( )
                               // title = "Test Titre" , author="Test auteur", genre="Test Genre", 
                                library.books.append( books)
                            } label: {
                                Image(systemName: "Plus")
                            }
                        }
                    }
                    
                    Text("Function possible : ");
                    //Button for additionnal
                    VStack {
                        Button("Add") {
                            showAddBook = true
                        }
                    }.sheet(isPresented: $showAddBook) {
                         AddBook(showAddBook: $showAddBook)
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
            } else {
                LoginView()
            }
            
            if let errorMessage = model.errorMessage{
                Text(errorMessage)
                    .padding()
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
    func removeBooks(at offset: IndexSet){
        library.books.remove(atOffsets: offset)
        
    }
}
 
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
 //For Additional
struct  AddBook: View {
    @Binding var showAddBook: Bool
    
    var body: some View {
        VStack {
            Text("Book who wanted to add ")
                .padding()
                //Form
            
            Button("OK") {
                showAddBook = false
            }
        }
    }
}
 //FOr Delete
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

 
