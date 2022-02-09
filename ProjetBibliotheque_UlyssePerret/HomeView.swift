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
                    Text("Hello2 , \(user.uid)")
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
