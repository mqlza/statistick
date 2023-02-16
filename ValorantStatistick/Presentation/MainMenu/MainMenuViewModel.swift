//
//  MainMenuViewModel.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import Foundation
import UIKit

final class MainMenuViewModel: CommonViewModel {
    
    var nickname: String {
        interactor.nickname
    }
    
    var place: String {
        interactor.place
    }
    
    var rank: String {
        interactor.rank
    }
    
    var kda: String {
        interactor.kda
    }
    
    var matchScore: String {
        interactor.matchScore
    }
    
    var winRate: String {
        interactor.winRate
    }
    
    var scoreKDA: String {
        interactor.scoreKDA
    }
    
    var buttonMenu: String {
        interactor.buttonMenu
    }
    
    var lastTen: String {
        interactor.lastTen
    }
    
    var lastTenKDA: String {
        interactor.lastTenKDA
    }
    
    var lastTenScore: String {
        interactor.lastTenScore
    }
    
    var mostPlayed: String {
        interactor.mostPlayed
    }
    
    var lastTenTotal: String {
        interactor.lastTenTotal
    }
    
    var menuText: [String] {
        interactor.menuText
    }
    
    var scoreTable: [String] {
        interactor.scoreTable
    }
    
    var kdaTable: [String] {
        interactor.kdaTable
    }
    
    var mapTable: [String] {
        interactor.mapTable
    }
    
    var regime: [String] {
        interactor.regimeTable
    }
    
    var timeTable: [String] {
        interactor.timeTable
    }
    
    var matchScoreTable: [String] {
        interactor.matchScoreTable
    }
    
    var procent: [String] {
        interactor.procent
    }
    
    var charImgTable: [UIImage] {
        interactor.charImgTable
    }
    
    var profileImg: UIImage {
        interactor.profileImg
    }
    
    var rankImg: UIImage {
        interactor.rankImg
    }
    
    var selectFiltr: MatchType?

    func load() {
        interactor.load()
    }
    
    func setDataSet() {
        interactor.setDataSet()
    }
    
    private var dataSet: [Match] = []
    
    var diplayData: [Match] {
        guard let type = selectFiltr else { return dataSet }
        return dataSet.filter { $0.type == type }
    }
    
    
    init(interactor: MainMenuInteractorProtocol) {
        self.interactor = interactor
    }
    private var interactor: MainMenuInteractorProtocol
    
}
