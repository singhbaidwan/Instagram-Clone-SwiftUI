//
//  StoryView.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 05/01/23.
//

import SwiftUI

struct StoryView: View {
    @State var storyData:[StoryDataModel]
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            LazyHGrid(rows: gridLayout,alignment: .center,spacing: 5) {
                ForEach(storyData) { story in
                    StoryCellView(storyData: story, action: {})
                }
            }
            .padding(.horizontal,15)
            .padding(.vertical,12)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(storyData: StoryData)
    }
}
