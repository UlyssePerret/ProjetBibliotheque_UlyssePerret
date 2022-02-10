//
//  HomeView.swift
//  Tuesday
//
//  Created by Ulysse Perret on 08/02/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ViewModel
    @State var showModalAdd = false
    @State var showModalDelete = false
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
                        Text("Livre : \(title)");
                        
                        VStack{
                            Text("Detail du Livre : ");
                            //Title
                            let title = book.title ?? "No Title"
                            Text("Title : \(title)");
                            //Author
                            let author = book.author ?? "Author Anonyme"
                            Text("Author : \(author)");
                            //Gender
                            let gender = book.gender ?? "No gender"
                            Text("Gender : \(gender)");
                            //Language
                            let language = book.gender ?? "Unknow Language"
                            Text("Language : \(language)");
                            //Publication date
                            let publication_date = book.publication_date ??  "Date unknow"
                            Text("Date publication : \( publication_date)");
                        }
                    }
                    Text("Function possible : ");
                  
                    //Button for additionnal
                    VStack {
                        Button("Add") {
                            showModalAdd = true
                        }
                    }.sheet(isPresented: $showModalAdd) {
                        ModalViewAdd(showModalAdd: $showModalAdd)
                    }
                    
                    //Button for Delete
                    VStack {
                        Button("Delete") {
                            showModalDelete = true
                        }
                    }.sheet(isPresented: $showModalDelete) {
                        ModalViewDelete(showModalDelete: $showModalDelete)
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
}
 
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
 
struct ModalViewAdd: View {
    @Binding var showModalAdd: Bool
    
    var body: some View {
        VStack {
            Text("Book who wanted to add ")
                .padding()
                //Form
            
            
            Button("OK") {
                showModalAdd = false
            }
        }
    }
}
 
struct ModalViewDelete: View {
    @Binding var showModalDelete: Bool
    @EnvironmentObject var model: ViewModel
    var body: some View {
        VStack {
            Text("Book who wanted to Delete ")
                .padding()
            List(model.books) { book in
                let title = book.title ?? "No Title"
                Text("Delete: \(title) ?");
                Button("Yes") {
                    showModalDelete = false
                    }
               
            }
            Button("Return") {
                showModalDelete = false
                }
         }
     }
}

struct Books{
    let title: String
    let author: String
    let gender: String
    let language : String
    let publication_date: String
    
}
 
