//
//  GameService.swift
//  GameWorld
//
//  Created by vikas on 28/12/19.
//  Copyright © 2019 VikasWorld. All rights reserved.
//

import Foundation
protocol GameService {
    func fetchPopularGames(for platform:Platform,completion: @escaping (Result<[GameContent],Error>) -> Void)
    func fetchGame(id:Int,completion: @escaping (Result<GameContent,Error>) -> Void)
}
