//
//  GameInfo.swift
//  GameWorld
//
//  Created by vikas on 28/12/19.
//  Copyright © 2019 VikasWorld. All rights reserved.
//
import SwiftUI
class GameInfo: ObservableObject{
    @Published var game : GameContent? = nil
    @Published var isLoading = false
    
    var gameService: GameService = GameApi.shared
    func reload(name:String,id:Int){
        self.isLoading  = true
        
        self.gameService.fetchGame(id: id) {[weak self] (result) in
            self?.isLoading = false
            switch result{
            case .success(let game):
                self?.game = game
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
