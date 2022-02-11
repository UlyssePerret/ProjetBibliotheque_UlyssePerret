//
//  LogOutView.swift
//  Tuesday
//
//  Created by Ulysse Perret on 08/02/2022.
//
//Disconnect
import SwiftUI
import FirebaseAuth

struct LogOutView: View {
    @EnvironmentObject var model: ViewModel
    var body: some View {
        VStack{
            Button( action: {
                model.logout()
            }, label: {
                            Text("Log out")
                    .fontWeight(.bold)
            }).padding()
            
        }
        .padding()
    }
}

struct LogOutView_Previews: PreviewProvider {
    static var previews: some View {
        LogOutView()
    }
}
