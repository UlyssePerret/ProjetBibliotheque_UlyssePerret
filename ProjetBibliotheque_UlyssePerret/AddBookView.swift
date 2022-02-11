//
//  AddBookView.swift
//  ProjetBibliotheque_UlyssePerret
//
//  Created by Ulysse Perret on 11/02/2022.
//

import Foundation
import SwiftUI
 
 
//For Additional
struct  AddBookView: View { 

   @EnvironmentObject var model: ViewModel
  // @StateObject var library  = Library()
   
   @Binding var showAddBook: Bool
    
   @State private var title: String = ""
    @State private var author: String = ""
    @State private var genre: String = ""
    @State private var language : String = ""
    @State private  var publication_date: String = ""
   
 //  @State var price: Double
 
   var body: some View {
       
       VStack {
           Text("Book who wanted to add ")
               .padding()
               //Form
           //model: ViewModel()
          // TextField("Name of your region", text: $model.name)
           TextField("Title", text: $title)
           TextField("Author", text: $author)
           TextField("Genre", text: $genre)
           TextField("Title", text: $language)
           TextField("Publication Date", text: $publication_date)
           
           Button("Add the book") {
               showAddBook = false
               //self.ref.child("users").child(user.uid).setValue(["username": username])
               
               //self.ref.child("Bibliotheque").child(Bibliotheque.uid).setValue(["title": title])

           }
       }
   }
}
