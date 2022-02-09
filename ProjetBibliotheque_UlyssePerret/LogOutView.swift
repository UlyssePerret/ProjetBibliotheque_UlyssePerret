//
//  LogOutView.swift
//  Tuesday
//
//  Created by Ulysse Perret on 08/02/2022.
//

import SwiftUI
import FirebaseAuth

struct LogOutView: View {
    @EnvironmentObject var model: ViewModel
    var body: some View {
        VStack{
            Button("Log out", action: {
                model.logout()
            })
        }
        .padding()
    }
}

struct LogOutView_Previews: PreviewProvider {
    static var previews: some View {
        LogOutView()
    }
}
