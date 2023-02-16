//
//  LoginScreenInteractor.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import Foundation
import UIKit

protocol LoginScreenInteractorProtocol {
    
    var labelText: [String] { get }
    
    var secondLabelText: [String] { get }
    
    var buttonText: String { get }
    
    var imageScreen: UIImage { get }
    
    func load()
    
    func setUser()
}

protocol LoginScreenInteractorDeps {
    
}

final class LoginScreenInteractor: LoginScreenInteractorProtocol {
    
    var labelText: [String] = ["не загружено"]
    
    var secondLabelText: [String] = ["не загружено"]
    
    var buttonText: String = "не загружено"
    
    var imageScreen: UIImage = UIImage(named: "valo")!
    
    
    
    
    init(deps: LoginScreenInteractorDeps) {
        self.deps = deps
    }
    
    func load() {
        
        labelText = ["Начни свою игру", "Продолжи свою игру", "Выиграй свою игру"]
        secondLabelText = ["В данном приложении ты можешь посмотреть всю статистику и узнать на какой ранг отыграл последнюю игру", "В данном приложении ты можешь посмотреть всю статистику и узнать на какой ранг отыграл последнюю игру", "В данном приложении ты можешь посмотреть всю статистику и узнать на какой ранг отыграл последнюю игру"]
        buttonText = "Войти"
        imageScreen = UIImage(named: "valo")!
    }
    
    func setUser() {
        //
    }
    
    private var deps: LoginScreenInteractorDeps
    
}
