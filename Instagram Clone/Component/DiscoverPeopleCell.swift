//
//  DiscoverPeopleCell.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 09/01/23.
//

import SwiftUI

struct DiscoverPeopleCell: View {
    var body: some View {
        VStack{
            Image("demo")
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 130)
                .clipShape(Circle())
            
            Text("Tim Cook")
                .foregroundColor(.primary)
                .font(.system(size: 20,weight: .semibold))
            Text("Followed By tim cook + tim cook\n 21 more")
                .foregroundColor(.secondary)
                .font(.system(size: 15,weight: .regular))
                .lineLimit(2)
                .multilineTextAlignment(.center)
            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height:40)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .center) {
                        Text("Follow")
                            .font(.system(size: 20,weight: .semibold))
                            .foregroundColor(.white)
                    }
            }
        }
        .padding(10)
        .frame(width: 200,height: 290)
        .overlay(alignment: .topTrailing, content: {
            Button {
                
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 20,weight: .regular))
                    .padding([.trailing,.top],10)
                    .foregroundColor(.secondary)
            }

        })
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .fill(.primary)
        )
    }
}

struct DiscoverPeopleCell_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPeopleCell()
    }
}
