//
//  GuideScreenViewModel.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import Foundation

final class GuideScreenViewModel: CommonViewModel {
    
    init(interactor: GuideScreenInteractorProtocol) {
        self.interactor = interactor
    }
    private var interactor: GuideScreenInteractorProtocol
}
