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
   @State var  title: String?
   @State var author: String?
   @State var genre: String?
   @State var language : String?
   @State var publication_date: String?
 //  @State var price: Double
 
   var body: some View {
       
       VStack {
           Text("Book who wanted to add ")
               .padding()
               //Form
          
           //TextField("Title", text:  $title)
           
           Button("OK") {
               showAddBook = false
           }
       }
   }
}
