//
//  GuideScreenInteractor.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import Foundation


protocol GuideScreenInteractorProtocol {
}

protocol GuideScreenInteractorDeps {
    
}

final class GuideScreenInteractor: GuideScreenInteractorProtocol {
    
    init(deps: GuideScreenInteractorDeps) {
        self.deps = deps
    }
    private var deps: GuideScreenInteractorDeps
}
