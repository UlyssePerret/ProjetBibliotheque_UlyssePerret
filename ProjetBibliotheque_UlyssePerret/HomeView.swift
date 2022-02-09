//
//  HomeView.swift
//  Tuesday
//
//  Created by Ulysse Perret on 08/02/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack{
            if let user = model.user{
                VStack {
                    Text("Bienvenue , \(user.uid)")
                    List(model.books) { book in
                        let titre = book.titre ?? "Pas de titre"
                        Text("Book : \(titre)");
                        let auteur = book.auteur ?? "Pas auteur"
                        Text("Book : \(auteur)");
                        let genre = book.genre ?? "Pas de genre"
                        Text("Book : \(genre)")
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
