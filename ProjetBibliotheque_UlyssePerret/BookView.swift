//
//  BookView.swift
//  ProjetBibliotheque_UlyssePerret
//
//  Created by Ulysse Perret on 09/02/2022.
//

import SwiftUI

struct BookView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack{
            if let user = model.user{
                VStack {
                    Text("Bienvenue dans la bibliotheque , \(user.uid)")
                    List(model.books) { book in
                        let name = book.name ?? "No name"
                        Text("Book : \(name)")
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

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
