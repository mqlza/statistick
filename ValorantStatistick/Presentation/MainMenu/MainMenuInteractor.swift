//
//  MainMenuInteractor.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import Foundation
import UIKit

protocol MainMenuInteractorProtocol {
    
    func setDataSet()
    
    var dataSet: [Match] { get }
    
    var nickname: String { get }
    
    var place: String { get }
    
    var rank: String { get }
    
    var kda: String { get }
    
    var matchScore: String { get }
    
    var winRate: String { get }
    
    var scoreKDA: String { get }
    
    var buttonMenu: String { get }
    
    var menuText: [String] { get }
    
    var lastTen: String { get }
    
    var lastTenScore: String { get }
    
    var lastTenKDA: String { get }
    
    var lastTenTotal: String { get }
    
    var mostPlayed: String { get }
    
    var charImgTable: [UIImage] { get }
    
    var scoreTable: [String] { get }
    
    var kdaTable: [String] { get }
    
    var matchScoreTable: [String] { get }
    
    var mapTable: [String] { get }
    
    var regimeTable: [String] { get }
    
    var timeTable: [String] { get }
    
    var procent: [String] { get }
    
    var profileImg: UIImage { get }
    
    var rankImg: UIImage { get }

    func load()
    
}

protocol MainMenuInteractorDeps {
    
}

final class MainMenuInteractor: MainMenuInteractorProtocol {
    
    var dataSet: [Match] = []
    
    var procent: [String] = ["не загружено", "не загружено"]
    
    var scoreTable: [String] = ["не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено"]
    
    var kdaTable: [String] = ["не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено"]
    
    var matchScoreTable: [String] = ["не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено"]
    
    var mapTable: [String] = ["не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено"]
    
    var regimeTable: [String] = ["не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено"]
    
    var timeTable: [String] = ["не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено", "не загружено"]
    
    var lastTen: String = "не загружено"
    
    var lastTenScore: String = "не загружено"
    
    var lastTenKDA: String = "не загружено"
    
    var lastTenTotal: String = "не загружено"
    
    var mostPlayed: String = "не загружено"
    
    var nickname: String = "не загружено"
    
    var place: String = "не загружено"
    
    var rank: String = "не загружено"
    
    var kda: String = "не загружено"
    
    var matchScore: String = "не загружено"
    
    var winRate: String = "не загружено"
    
    var scoreKDA: String = "не загружено"
    
    var buttonMenu: String = "не загружено"
    
    var menuText: [String] = ["не загружено", "не загружено", "не загружено", "не загружено"]
    
    var charImgTable: [UIImage] = [UIImage(named: "omen")!, UIImage(named: "reyna")!, UIImage(named: "britch")!, UIImage(named: "jett")!, UIImage(named: "viper")!,]
    
    var profileImg: UIImage = UIImage(named: "pig")!
    
    var rankImg: UIImage = UIImage(named: "radiant")!
    
    
    init(deps: MainMenuInteractorDeps) {
        self.deps = deps
    }
    
    func load() {
        
        procent = ["25%", "25%"]
        
        scoreTable = ["13 / 4 / 2", "22 / 12 / 7", "10 / 15 / 2", "28 / 22 / 11", "28 / 30 / 2", "30 / 25 / 8", "11 / 12 / 4", "17 / 8 / 1", "8 / 6 / 2", "24 / 17 / 9"]
        
        kdaTable = ["1.27 KDA", "0.87 KDA", "1.52 KDA", "1.11 KDA", "0.95 KDA", "1.01 KDA", "2.05 KDA", "0.73 KDA", "1.14 KDA", "1.43 KDA"]
        
        matchScoreTable = ["13-11", "16-16", "4-3", "30-28", "28-30", "8-13", "2-4", "13-4", "10-13", "13-6"]
        
        mapTable = ["Bind", "Acent", "Icebox", "Breeze", "Perl", "Fracture", "Haven"]
        
        regimeTable = ["Unranked", "Competitive", "Spike Rush", "Deathmatch"]
        
        timeTable = ["2 hours ago", "5 hours ago", "7 hours ago", "1 day ago", "2 day ago", "4 day ago", "7 day ago", "11 day ago", "12 day ago", "14 day ago"]
        
        nickname = "MQLZA#1234"
        
        place = "Top 239"
        
        rank = "Radiant"
        
        kda = "1.63"
        
        matchScore = "73W 13L"
        
        winRate = "Win Rate 80%"
        
        scoreKDA = "\(kda) / \(matchScore)"
        
        buttonMenu = "All"
        
        lastTen = "Last 10 matches"
        
        lastTenScore = "8W / 2L"
        
        lastTenKDA = "13.4 / 8.4 / 4.3"
        
        lastTenTotal = "1.36 KDA"
        
        mostPlayed = "Most Played"
        
        menuText = ["Competitive", "Unranked", "Spike Rush", "DeathMatch"]
        
        charImgTable = [UIImage(named: "omen")!, UIImage(named: "reyna")!, UIImage(named: "britch")!, UIImage(named: "jett")!, UIImage(named: "viper")!,]
        
        profileImg = UIImage(named: "pig")!
        
        rankImg = UIImage(named: "radiant")!
        
    }
    
    func setDataSet() {
        dataSet = [
            Match(agent: "Jett", score: "24/11/2", type: .competitive),
            Match(agent: "Omen", score: "14/12/2", type: .competitive),
            Match(agent: "Brimstone", score: "10/15/2", type: .unrated)
        ]
    }
    
    private var deps: MainMenuInteractorDeps
}
