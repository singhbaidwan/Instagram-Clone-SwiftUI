//
//  StoryDataModel.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 02/01/23.
//

import SwiftUI

struct StoryDataModel:Identifiable{
    var id = UUID().uuidString
    var image:String
    var name:String
    var isSeen:Bool
    var myStory:Bool
    var myStoryActive:Bool
}
