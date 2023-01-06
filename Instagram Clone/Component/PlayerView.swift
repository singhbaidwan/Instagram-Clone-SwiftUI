//
//  PlayerView.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 06/01/23.
//

import SwiftUI

struct PlayerView: UIViewRepresentable {
    
    var url: URL
    @Binding var isMute: Bool
    
    func makeUIView(context: Context) -> PlayVideo {
        return PlayVideo()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.manageData(url)
        uiView.toggleSound(isMute)
    }
    
}
