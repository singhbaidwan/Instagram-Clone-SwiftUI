//
//  ProfileView.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 02/01/23.
//

import SwiftUI
enum ProfilePhotoTagFilter:Int,CaseIterable{
    case profile
    case tag
    var imageName:String{
        switch self{
        case .profile:
            return "square.grid.3x3"
        case .tag:
            return "person.crop.square"
        }
    }
}
struct ProfileView: View {
    @State private var showStoryAddition:Bool = true
    @Namespace var animation
    @State private var selectedTab:ProfilePhotoTagFilter = .profile
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            ProfileHeader
            
            profileTagSwitcher
            
            VStack(alignment:.center){
                
                if selectedTab == .profile{
                    emptyUserProfilePhoto
                        .transition(.move(edge: .leading))
                }
                else
                {
                    emptyTagView
                        .transition(.move(edge: .trailing))
                }
               
            }
            .gesture(DragGesture(minimumDistance: 0,coordinateSpace: .local).onEnded({ value in
                if value.translation.width<0{
                    withAnimation(.easeInOut)
                    {
                        selectedTab = .profile
                    }
                }
                else if value.translation.width>0
                {
                    withAnimation(.easeInOut)
                    {
                        selectedTab = .tag
                    }
                }
            }))
            .frame(height: UIScreen.main.bounds.height-200)
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack(alignment: .center) {
                    Image(systemName: "lock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20,height: 20)
                    
                    Text("Tim Cook")
                        .font(.system(size: 25,weight: .bold))
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15,height: 15)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(alignment: .center) {
                    Image(systemName: "plus.app")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .offset(x:-20)
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .fontWeight(.light)
                        .frame(width: 30,height: 30)
                }
            }
        }
    }
    
    
    
}



extension ProfileView{
    
    var emptyUserProfilePhoto : some View{
        VStack{
            Circle()
                .stroke(lineWidth: 4)
                .fill(.primary)
                .frame(width: 120,height: 120)
                .background(
                Image(systemName: "plus.app")
                    .font(.system(size: 60,weight: .regular))
                
                )
            Text("Profile")
                .font(.system(size: 30,weight: .bold))
                .foregroundColor(.primary)
            
            Text("When you shape photos and videos,\n they'll appear on your profile\n")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .font(.system(size: 18,weight: .regular))
            Text("Share your first photo or video")
                .font(.system(size: 18,weight: .regular))
                .foregroundColor(.blue)

        }
    }
    
    var emptyTagView:some View{
        VStack{
            Circle()
                .stroke(lineWidth: 4)
                .fill(.primary)
                .frame(width: 120,height: 120)
                .background(
                Image(systemName: "person.crop.square")
                    .font(.system(size: 60,weight: .regular))
                
                )
            Text("Photos and\n videos of you")
                .font(.system(size: 30,weight: .bold))
                .foregroundColor(.primary)
            
            Text("When people tag you in photos and\nvideos,they'll appear here.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .font(.system(size: 18,weight: .regular))

        }
    }
    
    var ProfileHeader:some View{
        VStack{
//            HStack(alignment: .center){
//                Image(systemName: "lock")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 20,height: 20)
//
//                Text("Tim Cook")
//                    .font(.system(size: 25,weight: .bold))
//                Image(systemName: "chevron.down")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 15,height: 15)
//
//                Spacer()
//                Image(systemName: "plus.app")
//                    .resizable()
//                    .frame(width: 30,height: 30)
//                    .offset(x:-20)
//                Image(systemName: "line.3.horizontal")
//                    .resizable()
//                    .fontWeight(.light)
//                    .frame(width: 30,height: 30)
//            }
            
            HStack(alignment: .center) {
                Image("demo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140,height: 140)
                    .clipShape(Circle())
                Spacer()
                userPostFollowetc(10, "Posts")
                Spacer()
                userPostFollowetc(10000, "Followers")
                Spacer()
                userPostFollowetc(450, "Following")
            }
            Group{
                Text("Tim Coook")
                    .font(.system(size: 18,weight: .bold))
                
                Text("CEO of APPLE")
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack{
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .font(.system(size: 16,weight: .semibold))
                        .foregroundColor(.primary)
                        .frame(height: 35)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.ultraThinMaterial)
                        )
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "person.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.primary)
                        .frame(width: 25,height:25)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.ultraThinMaterial)
                                .frame(width:35,height: 35)
                        )
                }
                
            }
            
            VStack{
                HStack{
                    Text("Story highlights")
                        .font(.system(size: 18,weight: .bold))
                    Spacer()
                    Image(systemName: showStoryAddition ? "chevron.up" : "chevron.down")
                        .font(.system(size: 15,weight: .semibold))
                }
                if showStoryAddition{
                    Text("Keep your favorite stories on your profile")
                        .frame(maxWidth: .infinity,alignment: .leading)
                    HStack(alignment:.center){
                        ForEach(0...4,id:\.self){id in
                            if id == 0{
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.primary)
                                    .frame(width: 70,height: 70)
                                    .overlay {
                                        Image(systemName: "plus")
                                            .font(.system(size: 25,weight: .semibold))
                                            .foregroundColor(.primary)
                                        
                                    }
                            }
                            else{
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 70,height: 70)
                            }
                        }
                    }
                    Text("New")
                        .font(.system(size: 18,weight: .semibold))
                        .padding(.leading,35)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            }
            .onTapGesture {
                withAnimation {
                    showStoryAddition.toggle()
                }
            }
        }
        .padding(.horizontal,5)
    }
    
    var profileTagSwitcher:some View{
        HStack{
            ForEach(ProfilePhotoTagFilter.allCases,id:\.rawValue){ item in
                VStack{
                    Image(systemName: item.imageName)
                        .resizable()
                        .frame(width: 30,height: 30)
                        .foregroundColor(selectedTab == item ? .primary : .secondary)
                    if selectedTab == item{
                        Capsule()
                            .foregroundColor(.primary)
                            .frame(height:3)
                            .matchedGeometryEffect(id: "filters", in: animation)
                    }
                    else
                    {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height:3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut)
                    {
                        self.selectedTab = item
                    }
                }
            }
        }.overlay {
            Divider()
                .offset(x:0 ,y:17)
        }
        
    }
    
    
    
    
    @ViewBuilder
    func userPostFollowetc(_ number:Int,_ name:String)->some View
    {
        VStack(alignment:.center,spacing:2){
            Text("\(number)")
                .font(.system(size: 20,weight: .bold))
            Text(name)
                .font(.system(size: 16,weight: .medium))
        }
    }
    
}




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        
        }
    }
}
