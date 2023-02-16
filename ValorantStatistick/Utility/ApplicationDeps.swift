//
//  ApplicationDeps.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import Foundation

protocol ApplicationDeps:
    LoadingScreenInteractorDeps,
    LoginScreenInteractorDeps,
    MainMenuInteractorDeps,
    GuideScreenInteractorDeps
{}

final class ApplicationDepsImpl: ApplicationDeps {
    
    // MARK: - Singleton
    static let shared = ApplicationDepsImpl()
}
