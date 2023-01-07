//
//  PostView.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 05/01/23.
//

import SwiftUI
import AVKit

struct PostView: View {
    @State var postData:PostDataModel
    
    @State private var isLiked:Bool = false
    @State private var isSaved:Bool = false
    @State private var isLikedAnimation:Bool = false
    @State private var isMute:Bool = true
    @State private var showMore:Bool = false
    
    func hideAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
            isLikedAnimation = false
        })
    }
    
    func estimatedHeight(_ width:Float,_ height:Float)->CGFloat{
        let ratio = CGFloat(height)/CGFloat(width)
        let estimatedH = ratio * UIScreen.main.bounds.width
        return estimatedH
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            //MARK: POST HEADER
            HStack(alignment:.center,spacing: 10)
            {
                Image(postData.profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 33, height: 33, alignment: .center)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(Color.gray,lineWidth: 0.5)
                    }
                if postData.location != nil && postData.isSponsored == false{
                    VStack(alignment:.leading,spacing: 1){
                        Text(postData.userName)
                            .font(.system(size: 14,weight: .semibold))
                        Text(postData.location)
                            .font(.system(size: 12))
                    }
                } else if postData.isSponsored{
                    VStack(alignment: .leading, spacing: 1) {
                        Text(postData.userName)
                            .font(.system(size: 14,weight: .semibold))
                        Text("Sponsored")
                            .font(.system(size: 12))
                    }
                }
                else
                {
                    Text(postData.userName)
                        .font(.system(size: 14,weight: .semibold))
                }
                Spacer()
                Button {
                    print("Present the bottom sheet more")
                } label: {
                    Image("more")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30,height: 30,alignment: .center)
                }
            }
            .padding(.vertical,10)
            .padding(.horizontal,12)
            Divider()
            
            
            //MARK: Image and Post Data
            
            if !postData.isVideo{
                ZStack(alignment: .center){
                    Image(postData.postImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: estimatedHeight(postData.dimensionImage.width, postData.dimensionImage.height))
                        .clipped()
                        .onTapGesture(count: 2) {
                            postData.isLiked = true
                            isLikedAnimation = true
                            hideAnimation()
                        }
                    Image("white-heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 170,height: 170)
                        .scaleEffect(isLikedAnimation ? 1 : 0)
                        .opacity(isLikedAnimation ? 1 : 0)
                        .animation(.spring())
                }
            } else
            {
                ZStack(alignment: .center) {
                    
                    if let videoPath = Bundle.main.url(forResource: postData.videoUrl, withExtension: "mp4")
                    {
                        // swiftui video player will not work as we need to use mute functionality so used a uikit AVplayer
                        
                        PlayerView(url: videoPath, isMute: $isMute)
                            .frame(width: UIScreen.main.bounds.width,height: estimatedHeight(postData.dimensionVideo.width, postData.dimensionVideo.height))
                            .onTapGesture(count: 2) {
                                postData.isLiked = true
                                isLikedAnimation = true
                                hideAnimation()
                            }
                    }
                    Image("white-heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 170,height: 170)
                        .scaleEffect(isLikedAnimation ? 1 : 0)
                        .opacity(isLikedAnimation ? 1 : 0)
                        .animation(.spring())
                }
                .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        isMute.toggle()
                    } label: {
                        ZStack{
                            Circle()
                                .fill(Color(red: 0, green: 0, blue: 0))
                                .frame(width: 30,height: 30)
                                .opacity(0.8)
                            Image(isMute ? "mute" : "sound")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .scaledToFill()
                                .frame(width: 17,height: 17)
                                .clipShape(Circle())
                        }
                        
                    }
                    .padding(13)
                    
                }
                
            }
            
            if postData.isSponsored{
                Button {
                    
                } label: {
                    HStack(alignment: .center) {
                        Text("Learn More")
                            .font(.system(size: 14,weight: .medium))
                            .foregroundColor(.blue)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.blue)
                            .font(.system(size: 14,weight: .medium))
                    }
                    .padding(.vertical,13)
                    .padding(.horizontal,15)
                    
                }
                Divider()
                    .padding(.horizontal,15)
                
            }
            
            HStack(alignment: .center, spacing: 10) {
                Button {
                    postData.isLiked = !postData.isLiked
                } label: {
                    Image(postData.isLiked ? "like-selected" : "like")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30, alignment: .center)
                }
                
                Button {
                    
                } label: {
                    Image("comment")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30,height: 30,alignment: .center)
                    
                }
                
                Button {
                    
                } label: {
                    Image("share")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30, alignment: .center)
                }
                
                Spacer()
                Button {
                    postData.isSaved = !postData.isSaved
                } label: {
                    Image(postData.isSaved ? "save-selected":"save")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30, alignment: .center)
                }
            }
            .padding(.vertical,8)
            .padding(.horizontal,15)
            
            if postData.likes != 0 && !postData.isVideo{
                Text("\(postData.likes) likes")
                    .font(.system(size: 14,weight: .semibold))
                    .padding(.horizontal,15)
            } else if postData.views != 0{
                Text("\(postData.views) Views")
                    .font(.system(size: 14,weight: .semibold))
                    .padding(.horizontal,15)
            }
            
            if postData.caption != nil {
                Group{
                    Text(postData.userName)
                        .font(.system(size: 14,weight: .semibold))
                    + Text(" ")
                    + Text(showMore || postData.caption.count < 20 ? postData.caption : postData.caption.suffix(20)+" more....")
                        .font(.system(size: 14))
                }
                .onTapGesture {
                    if postData.caption.count > 20 {
                        withAnimation {
                            showMore.toggle()
                        }
                    }
                }
                .padding(.horizontal,15)
                .padding(.vertical,6)
            }
            
            if !postData.isSponsored{
                Text(postData.time)
                    .foregroundColor(.gray)
                    .font(.system(size:13,weight:.medium))
                    .padding(.horizontal,15)
                    .padding(.vertical,7)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postData: PostData[4])
    }
}
