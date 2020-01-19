//
//  GameList.swift
//  GameWorld
//
//  Created by vikas on 28/12/19.
//  Copyright © 2019 VikasWorld. All rights reserved.
//

import Foundation
import SwiftUI
class GameList : ObservableObject{
    @Published var games: [GameContent] = []
    @Published var isLoading = false
    
    var gameService = GameApi.shared
    
    func reload(platform:Platform = .ps4){
        self.games = []
        self.isLoading = true
        gameService.fetchPopularGames(for: platform) { [weak self] (result) in
            self?.isLoading = false
            
            switch result{
            case .success(let games):
                self?.games = games
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
}
}
