//
//  LoadingScreenInteractor.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import Foundation
import UIKit

protocol LoadingScreenInteractorProtocol {
}

protocol LoadingScreenInteractorDeps {
    
}

final class LoadingScreenInteractor: LoadingScreenInteractorProtocol {
    
    init(deps: LoadingScreenInteractorDeps) {
        self.deps = deps
    }
   
    private var deps: LoadingScreenInteractorDeps
}
