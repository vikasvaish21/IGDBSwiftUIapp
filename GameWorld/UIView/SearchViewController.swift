//
//  SearchViewController.swift
//  GameWorld
//
//  Created by vikas on 29/12/19.
//  Copyright © 2019 VikasWorld. All rights reserved.
//

import Foundation
import SwiftUI
struct SearchViewController: View {
    
    @State private var searchTerm:String = ""
    @ObservedObject var gameData: GameListViewModel = GameListViewModel()
    var body: some View{
        NavigationView{
            Group{
                if(self.gameData.isLoading){
                    LoadingView()
                }
                else{
                    VStack{
                        SearchBar(text: self.$searchTerm)
                        List(self.gameData.games){
                            game in
                            NavigationLink(destination: GameDetailView(gameID: 0,gameName: game.name)){
                                HStack{
                                    VStack(alignment: .leading, spacing: 8){
                                        Text(game.name)
                                            .font(.headline)
                                        Text("Cover: \(game.company)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                   // GameRowView(game: game)
                                
                            }
                        }
                    }
                }
            }
        .navigationBarTitle(Text("Games"))
        }
    }
}
