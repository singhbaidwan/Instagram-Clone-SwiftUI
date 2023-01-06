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
                        
                        
                        
                    }
                    
                }
            }
            
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postData: PostData[2])
    }
}
