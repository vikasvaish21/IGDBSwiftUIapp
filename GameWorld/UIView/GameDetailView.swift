//
//  GameDetailView.swift
//  GameWorld
//
//  Created by vikas on 28/12/19.
//  Copyright © 2019 VikasWorld. All rights reserved.
//

import Foundation
import SwiftUI
struct GameDetailView: View {
    @ObservedObject var gameDetail = GameInfo()
    @ObservedObject var imageLoader = ImageLoader()
    
    var gameID: Int
    var gameName: String
    var body: some View{
        Group {
            if (self.gameDetail.game != nil) {
                List {
                    PosterView(image: self.imageLoader.image)
                        .onAppear{
                        if let url = self.gameDetail.game?.coverURL{
                            self.imageLoader.downloadImage(url: url)
                        }
                    }
                        GameSectionView(game: self.gameDetail.game!)
                }
            }else {
                LoadingView()
            }
        }
        .edgesIgnoringSafeArea([.top])
        .onAppear{
            self.gameDetail.reload(name: self.gameName, id: self.gameID)
           
        }
    }
}
struct PosterView: View {
    var image:UIImage?
    var body: some View{
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .aspectRatio(500/700, contentMode: .fit)
            if(image != nil){
                Image(uiImage:self.image!)
                .resizable()
                    .aspectRatio(500/700,contentMode: .fit)
            }
        }
    }
}
struct GameSectionView:View {
    var game: GameContent
    var body: some View{
        Section{
            Text(game.summary)
                .font(.body)
            .lineLimit(nil)
            
            if (!game.storyline.isEmpty){
                Text(game.storyline)
                    .font(.body)
                .lineLimit(nil)
            }
            Text(game.genreText)
                .font(.subheadline)
            Text(game.releaseDateText)
                .font(.subheadline)
            Text(game.company)
                .font(.subheadline)
        }
    }
}
