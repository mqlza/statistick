//
//  TableView.swift
//  ValorantStatistick
//
//  Created by Георгий on 11.11.2022.
//

import Foundation
import UIKit

struct Match {
    
    var agent: String
    var score: String
    var type: MatchType
}

enum MatchType {
    case competitive
    case unrated
}

struct Player {
    
    var name: String
    var matches: [Match]
    
}
