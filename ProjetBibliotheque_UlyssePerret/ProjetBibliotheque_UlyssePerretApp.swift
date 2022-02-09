//
//  ProjetBibliotheque_UlyssePerretApp.swift
//  ProjetBibliotheque_UlyssePerret
//
//  Created by Ulysse Perret on 09/02/2022.
//

import SwiftUI
import Firebase

@main
struct ProjetBibliotheque_UlyssePerretApp: App {
    
    
    init() {
        FirebaseApp.configure()
    }
     
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
