//
//  StoryView.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 02/01/23.
//

import SwiftUI

struct StoryCellView: View {
    
    @State var storyData:StoryDataModel
    
    var action:()->Void
    
    private let gradient = LinearGradient( gradient: Gradient(colors: [Color.yellow, Color(red: 252/255, green: 175/255, blue: 69/255) , Color.red, Color(red: 225/255, green: 48/255, blue: 108/255), Color(red: 193/255, green: 53/255, blue: 132/255) , Color(red: 131/255, green: 58/255, blue: 180/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)
    
    
    var body: some View {
        VStack(alignment:.center,spacing: 8){
            ZStack{
                Image(storyData.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 62,height: 62,alignment: .center)
                    .clipShape(Circle())
                
                if storyData.myStory && storyData.myStoryActive && !storyData.isSeen{
                    Circle().stroke(gradient,style: StrokeStyle(lineWidth: 2.5, lineCap: .round))
                        .frame(width: 72, height: 72, alignment: .center)
                }
                else if storyData.myStory && storyData.myStoryActive && storyData.isSeen{
                    Circle().stroke(Color(red: 220/255, green: 220/255, blue: 220/255),style:
                                        StrokeStyle(lineWidth: 1,lineCap:.round))
                    .frame(width: 72, height: 72, alignment: .center)
                } else if storyData.myStory && !storyData.myStoryActive{
                    ZStack{
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: 25,height: 25)
                        Image(systemName: "plus")
                            .font(.system(size: 14,weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 20,height: 20)
                    }
                    .overlay(Circle().stroke(.white,lineWidth: 2.5))
                    .offset(x: 20, y: 20)
                } else if !storyData.isSeen{
                    Circle().stroke(gradient,style: StrokeStyle(lineWidth: 2.5,lineCap: .round))
                        .frame(width: 72,height: 72,alignment: .center)
                }
                else{
                    Circle().stroke(Color(red: 220/255, green: 220/255, blue: 220/255),style:
                                        StrokeStyle(lineWidth: 1,lineCap: .round))
                    .frame(width: 72,height: 72,alignment: .center)
                }
            }
            
            Text(storyData.name)
                .lineLimit(1)
                .font(.system(size: 12,weight: .regular))
                .frame(width: 81)
                .foregroundColor(storyData.isSeen ? .secondary : .primary)
            
        }
        .onTapGesture {
            action()
        }
    }
    
    
}

struct StoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCellView(storyData: StoryData[0],action: {})
    }
}
