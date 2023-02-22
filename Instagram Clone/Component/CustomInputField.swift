//
//  CustomInputField.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 22/02/23.
//

import SwiftUI

struct CustomInputField: View {
    let imageName:String
    let placeHolderText:String
    var isSecureField:Bool? = true
    @Binding var text:String
    
    var body: some View{
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                    .foregroundColor(.primary)
                if isSecureField ?? false{
                    SecureField(placeHolderText,text: $text)
                }
                else
                {
                    TextField(placeHolderText,text: $text)
                }
            }
            Divider()
                .background(.primary)
        }
    }
    
    
}



struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope", placeHolderText: "Email", text: .constant(""))
    }
}
