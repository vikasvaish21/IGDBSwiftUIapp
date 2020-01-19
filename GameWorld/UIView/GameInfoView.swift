//
//  GameInfoView.swift
//  GameWorld
//
//  Created by vikas on 28/12/19.
//  Copyright © 2019 VikasWorld. All rights reserved.
//

import SwiftUI
struct  GameInfoView: View{
    var body: some View{
        TabView{
            ForEach(Platform.allCases, id: \.self){
                p in GameListView(platform: p).tag(p)
                    .tabItem{
                        Image(p.assetName)
                        Text(p.description)
                }
                
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}
