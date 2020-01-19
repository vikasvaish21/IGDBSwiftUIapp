//
//  GameListView.swift
//  GameWorld
//
//  Created by vikas on 28/12/19.
//  Copyright © 2019 VikasWorld. All rights reserved.
//


import SwiftUI
struct GameListView: View {
    
    @ObservedObject var gameList: GameList = GameList()
    var platform: Platform = .ps4
    var body: some View{
        NavigationView{
            Group {
                if gameList.isLoading{
                    LoadingView()
                }else {
                    List(self.gameList.games){ (game:GameContent) in
                        NavigationLink(destination: GameDetailView(gameID: game.id,gameName: game.name)) {
                            GameRowView(game: game)
                        }
                }
            }
        }
        .navigationBarTitle(self.platform.description)
    }
    .onAppear{
        if self.gameList.games.isEmpty{
            self.gameList.reload(platform: self.platform)
            }
        }
    }
}
