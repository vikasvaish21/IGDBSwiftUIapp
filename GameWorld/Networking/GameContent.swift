//
//  GameContent.swift
//  GameWorld
//
//  Created by vikas on 28/12/19.
//  Copyright © 2019 VikasWorld. All rights reserved.
//

import Foundation

struct GameContent:Decodable{
    let id: Int
    let name:String
    let storyline:String
    let summary:String
    let releaseDate:Date
    let popularity:Double
    let rating:Double
    let coverURLString:String
    let screenshotURLsString:[String]
    let genres:[String]
    let company: String
    
    
    static let dateFormatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        return formatter
    }()
    
    var releaseDateText: String{
        return GameContent.dateFormatter.string(from: releaseDate)
    }
    
    var coverURL: URL?{
        return URL(string: coverURLString)
    }
    
    var genreText:String{
        return genres.joined(separator:", ")
    }
    
    var screenshotURLs:[URL]{
        return screenshotURLsString.compactMap{
            URL(string: $0)
        }
    }
}
extension GameContent:Identifiable{
}
