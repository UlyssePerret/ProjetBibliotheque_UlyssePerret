//
//  ContentView.swift
//  ProjetBibliotheque_UlyssePerret
//
//  Created by Ulysse Perret on 09/02/2022.
//
//For content
import SwiftUI

struct ContentView: View {
     @StateObject var model = ViewModel()
    //Body
    var body: some View {
            VStack{
                //For Tab- Navigation
                TabView {
                    //Page Library
                    HomeView()
                        .tabItem {
                            Label("Library", systemImage: "book")
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
