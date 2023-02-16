//
//  LoadingScreenViewModel.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import Foundation

final class LoadingScreenViewModel: CommonViewModel {
    
    init(interactor: LoadingScreenInteractorProtocol) {
        self.interactor = interactor
    }
    
    private var interactor: LoadingScreenInteractorProtocol
    
}
