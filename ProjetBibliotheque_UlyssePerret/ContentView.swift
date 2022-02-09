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
                            Label("Home", systemImage: "book")
                        }
                    //Logout
                    LogOutView()
                        .tabItem {
                            Label("Account", systemImage: "person")
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
