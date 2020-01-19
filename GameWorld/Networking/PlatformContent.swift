//
//  PlatformContent.swift
//  GameWorld
//
//  Created by vikas on 28/12/19.
//  Copyright © 2019 VikasWorld. All rights reserved.
//

import Foundation
enum Platform: Int, CustomStringConvertible,CaseIterable{
    case ps4 = 48
    case xboxone = 49
    case nswitch = 130
    
    var description: String{
        switch self {
        case .ps4:
            return "PS4"
        case .xboxone:
            return "Xbox One"
        case .nswitch:
            return "Nintendo Switch"
        }
    }
    
    var assetName: String{
        switch self {
        case .ps4:
            return "ps4"
        case .xboxone:
            return "xbox"
        case .nswitch:
            return "switch"
        }
    }
}
