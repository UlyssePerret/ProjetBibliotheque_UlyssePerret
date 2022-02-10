//
//  BookView.swift
//  ProjetBibliotheque_UlyssePerret
//
//  Created by Ulysse Perret on 10/02/2022.
//
//Page for Details information for book
import SwiftUI

struct BookView: View {
    @EnvironmentObject var model: ViewModel
    //BOdy
    var body: some View {
        VStack{
            //User
            if let user = model.user{
                //Keep user if need
                VStack {
                    //Welcome with Id
                    // Text("Bienvenue à toi , \(user.uid)")
                    Text("Welcome !")
                    //INformation for simple Book - title
                    List(model.books) { book in
                        let title = book.title ?? "No Title"
                        Text("Informations for Book: \(title)");
                        //Title
                        VStack{ 
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
 //Preview
struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
  
 
 

