//
//  ProjetBibliotheque_UlyssePerretApp.swift
//  ProjetBibliotheque_UlyssePerret
//
//  Created by Ulysse Perret on 09/02/2022.
//
//For project global
import SwiftUI
import Firebase

@main
struct ProjetBibliotheque_UlyssePerretApp: App {
    
    //Initialize Firebase
    init() {
        FirebaseApp.configure()
    }
    //Content- body
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
