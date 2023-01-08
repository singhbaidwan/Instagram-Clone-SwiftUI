//
//  SettingsView.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 07/01/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false)
        {
            ForEach(SettingListData){item in
                VStack(alignment: .leading) {
                    HStack(alignment: .center, spacing: 15) {
                        Image(item.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30,height: 30)
                        Text(item.title)
                            .font(.system(size: 17,weight: .regular))
                    }
                    .padding(.vertical,8)
                    .padding(.horizontal,15)
                    Divider()
                        .padding(.leading,50)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
