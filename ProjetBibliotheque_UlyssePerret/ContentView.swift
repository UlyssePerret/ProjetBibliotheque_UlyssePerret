//
//  ContentView.swift
//  ProjetBibliotheque_UlyssePerret
//
//  Created by Ulysse Perret on 09/02/2022.
//
//For content
import SwiftUI
//Cotent
struct ContentView: View {
     @StateObject var model = ViewModel()
 
    var body: some View {
            VStack{
                //For Tab- Navigation
                TabView {
                    //Page Library-Standard
                    HomeView()
                        .tabItem {
                            Label("Library", systemImage: "book")
                        }
                    //Book - for details
                    BookView()
                        .tabItem {
                            Label("Book", systemImage: "book")
                        }
                    //Logout
                    LogOutView()
                        .tabItem {
                            Label("Account", systemImage: "person")
                        }
                }
            }.environmentObject(model)
        }
    //Preview
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
