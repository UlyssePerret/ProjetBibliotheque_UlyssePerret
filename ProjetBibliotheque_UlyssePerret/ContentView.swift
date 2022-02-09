//
//  ContentView.swift
//  ProjetBibliotheque_UlyssePerret
//
//  Created by Ulysse Perret on 09/02/2022.
//

import SwiftUI

struct ContentView: View {
     @StateObject var model = ViewModel()

    var body: some View {
            VStack{
                TabView {
                    //Page Homme
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    //Logout
                    LogOutView()
                        .tabItem {
                            Label("Account", systemImage: "person")
                        }
                    //For View boos - 
                    BookView()
                        .tabItem {
                            Label("Bibliotheque", systemImage: "book")
                        }
                 
                }
                
            }.environmentObject(model)
        }
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
