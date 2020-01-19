//
//  GameListViewModel.swift
//  GameWorld
//
//  Created by vikas on 01/01/20.
//  Copyright © 2020 VikasWorld. All rights reserved.
//
import SwiftUI
import Foundation
import Combine

final class GameListViewModel: ObservableObject{
    @Published var isLoading : Bool = false
    @Published var games: [GameContent]  = []
    var searchTerm :String = ""

    private let searchTappedSubject = PassthroughSubject<Void,Error>()
    private var disposeBag = Set<AnyCancellable>()
    init(){
        searchTappedSubject.flatMap{_ in
            self.requestGames(searchTerm : self.searchTerm).handleEvents(receiveSubscription:{
                _ in DispatchQueue.main.async {
                    self.isLoading = true
                }
            },
            receiveCompletion: { comp in
        DispatchQueue.main.async {
        self.isLoading = false
                }
            }).eraseToAnyPublisher()
        }
        .replaceError(with: [])
        .receive(on: DispatchQueue.main)
        .assign(to: \.games, on: self)
        .store(in: &disposeBag)
    }

    func onSearchTapped() {
        searchTappedSubject.send(())
    }

    private func requestGames(searchTerm: String) -> AnyPublisher<[GameContent], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return Fail(error: URLError(.badURL))
                .mapError { $0 as Error }
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
               .map { $0.data }
               .mapError { $0 as Error }
               .decode(type: [GameContent].self, decoder: JSONDecoder())
            .map { searchTerm.isEmpty ? $0 : $0.filter { $0.name.contains(searchTerm) } }
               .eraseToAnyPublisher()
    }

}
