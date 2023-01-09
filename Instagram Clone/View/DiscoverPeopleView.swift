//
//  DiscoverPeopleView.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 09/01/23.
//

import SwiftUI

struct DiscoverPeopleView: View {
    private var twoGrid = [GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
            ScrollView(.vertical,showsIndicators: false){
                headerView
                
                Divider()
                    .background(.primary)
                    .frame(height: 3)
                
                Text("Top Suggestions")
                    .font(.system(size: 22,weight: .semibold))
                    .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,10)
                .padding(.top,20)
                
                LazyVGrid(columns: twoGrid, spacing: 10) {
                    ForEach(0...14,id:\.self){_ in
                        DiscoverPeopleCell()
                    }
                }
                
                .padding(.horizontal,10)
            }
        .navigationTitle("Discover People")
    }
}


extension DiscoverPeopleView{
    
    private var headerView:some View{
        VStack{
            HStack(alignment:.center,spacing:20){
                Image(systemName: "f.circle")
                    .resizable()
                    .frame(width:50,height: 50)
                    .foregroundColor(.blue)
                    .offset(x:-10)
                VStack(alignment:.leading){
                    Text("Connect to Facebook")
                        .font(.system(size: 18,weight: .semibold))
                        .foregroundColor(.primary)
                    Text("Follow your friends")
                        .font(.system(size: 16,weight: .regular))
                        .foregroundColor(.secondary)
                }
                Button {
                    
                } label: {
                    Text("Connect")
                        .font(.system(size: 18,weight: .semibold))
                        .foregroundColor(.white)
                        .padding([.horizontal],20)
                        .padding([.vertical],10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.blue)
                        )
                }
                
            }
            
            HStack(alignment:.center,spacing:20){
                Image(systemName: "book.closed")
                    .foregroundColor(.primary)
                    .font(.system(size: 30,weight: .semibold))
                VStack(alignment:.leading){
                    Text("Connect contacts")
                        .font(.system(size: 18,weight: .semibold))
                        .foregroundColor(.primary)
                    Text("Follow people you may know")
                        .font(.system(size: 16,weight: .regular))
                        .foregroundColor(.secondary)
                }
                Button {
                    
                } label: {
                    Text("Connect")
                        .font(.system(size: 18,weight: .semibold))
                        .foregroundColor(.white)
                        .padding([.horizontal],20)
                        .padding([.vertical],10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.blue)
                        )
                }
                
            }
            
        }
    }
    
}

struct DiscoverPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPeopleView()
    }
}
