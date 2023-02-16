//
//  LoginScreenViewModel.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import Foundation
import UIKit

final class LoginScreenViewModel: CommonViewModel {
    
    var labelText: [String] {
        interactor.labelText
    }
    
    var secondLabelText: [String] {
        interactor.secondLabelText
    }
    
    var buttonText: String {
        interactor.buttonText
    }
    
    var imagineScrene: UIImage {
        interactor.imageScreen
    }
    
    func load() {
        interactor.load()
    }
    
    func setUser() {
        interactor.setUser()
    }
    
    init(interactor: LoginScreenInteractorProtocol) {
        self.interactor = interactor
    }
    private var interactor: LoginScreenInteractorProtocol
}
