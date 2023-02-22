//
//  LoginView.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 20/02/23.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State var userEmail:String = ""
    @State var userPassword:String = ""
    var body: some View {
        VStack(alignment:.center,spacing: 30){
            
            Text("Instagram")
                .font(.largeTitle
                    .weight(.bold))
                .fontDesign(.serif)
            
            Group{
                TextField("Email or Username", text: $userEmail)
                TextField("Password",text: $userPassword)
            }
            //            .textFieldStyle(.roundedBorder)
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 1))
            
            Button {
                
            } label: {
                Text("Sign In")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
            }
            
            Group{
                Text("Forgot your Login details ?")+Text("Get help signing in").underline()
            }
            .font(.system(size: 13, weight: .light))
            HStack{
                VStack{
                    Divider()}
                Text("OR")
                VStack{
                    Divider()}
            }
            
         
            Button {
                
            } label: {
                Text("Dont have account Sign In ? ")
            }

            
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
