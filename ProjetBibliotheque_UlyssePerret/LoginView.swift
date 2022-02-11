//
//  LoginView.swift
//  Tuesday
//
//  Created by Ulysse Perret on 08/02/2022.
//
//Connect
import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @EnvironmentObject var model: ViewModel
    @State var mail = ""
    @State var password = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            //Email
            Text("Email")
            TextField("Email", text: $mail)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
            //Passsword
            Text("Password")
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            //Butto,
            Button("OK", action: {
                model.login(mail: mail, password: password)
            })
            .padding()
        }
        .padding()
    }
}
//Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
