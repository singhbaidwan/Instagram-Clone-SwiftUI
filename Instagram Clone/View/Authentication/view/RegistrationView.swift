//
//  RegistrationView.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 22/02/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email:String = ""
    @State private var username:String = ""
    @State private var password:String = ""
    @State private var fullname:String = ""
    
    /// :- Photo Picker Properties
    @State private var showImagePicker:Bool = false
    @State private var selectedImage:UIImage?
    @State private var profileImage:Image?
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            
            Text("Instagram")
                .font(.largeTitle
                    .weight(.bold))
                .fontDesign(.serif)
                .padding([.top,.bottom],20)
            
            Text("Sign Up To See Photos and Videos from Your Friend")
                .fontWeight(.medium)
                .fontDesign(.serif)
                .multilineTextAlignment(.center)
                .padding(.horizontal,20)
            
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                        .clipShape(Circle())
                }
                else
                {
                    Image(systemName: "person.crop.circle.fill.badge.plus")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                    
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }

            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeHolderText: "Email", text: $email)
                CustomInputField(imageName: "person", placeHolderText: "UserName", text: $username)
                CustomInputField(imageName: "person", placeHolderText: "Full Name", text: $fullname)
                CustomInputField(imageName: "lock", placeHolderText: "Password", isSecureField: true,text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            Button {
                
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 350,height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have account")
                        .font(.footnote)
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom,32)
            .foregroundColor(Color(.systemBlue))
        }
        
    }
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier:ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFit()
            .frame(width: 180,height: 180)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
