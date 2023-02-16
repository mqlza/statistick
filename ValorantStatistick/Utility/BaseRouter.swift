//
//  BaseRouter.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import Foundation
import UIKit

protocol Router {
    func route(to controller: UIViewController)
}

class BaseRouter {
    
    // MARK: - Initializers
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    // MARK: - public methods
    
    func routeToLoadingScreen() {
        
        let loginInteractor = LoginScreenInteractor(deps: deps)
        let loginViewModel = LoginScreenViewModel(interactor: loginInteractor)
        let loginViewController = LoginScreenViewController()
        
        let interactor = LoadingScreenInteractor(deps: deps)
        let viewModel = LoadingScreenViewModel(interactor: interactor)
        let loadingVC = LoadingScreenViewController()
        
        
        loginViewController.bind(viewModel: loginViewModel)
        
        let nav1 = UINavigationController()
        window?.rootViewController = nav1
        window?.makeKeyAndVisible()
        nav1.pushViewController(loginViewController, animated: true)
    }
    
    func tab() {
        
        let tabBar = UITabBarController()
        
        let guideInteractor = GuideScreenInteractor(deps: deps)
        let guideViewModel = GuideScreenViewModel(interactor: guideInteractor)
        let guideViewController = GuideScreenViewController()
        
        let mainInteractor = MainMenuInteractor(deps: deps)
        let mainViewModel = MainMenuViewModel(interactor: mainInteractor)
        let mainViewController = MainMenuViewController()
        
        secondVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        
        doobleVC.tabBarItem = UITabBarItem(title: "Guide", image: UIImage(named: "guide"), tag: 1)
        
        let selectedColor   = UIColor.red
        let unselectedColor = UIColor.systemGray
        
        UITabBar.appearance().tintColor = UIColor.red
        UITabBar.appearance().unselectedItemTintColor = UIColor.systemGray
        
        mainViewController.bind(viewModel: mainViewModel)
        guideViewController.bind(viewModel: guideViewModel)
        
        tabBar.modalPresentationStyle = .fullScreen
        tabBar.setViewControllers([secondVC, doobleVC], animated: true)
        window?.rootViewController = tabBar
        secondVC.pushViewController(mainViewController, animated: true)
        doobleVC.pushViewController(guideViewController, animated: true)
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 15/255, green: 24/255, blue: 34/255, alpha: 1.0)
        
        tabBar.tabBar.standardAppearance = appearance
        tabBar.tabBar.scrollEdgeAppearance = appearance
    }
    
    let secondVC = UINavigationController(rootViewController: MainMenuViewController())
    
    let doobleVC = UINavigationController(rootViewController: GuideScreenViewController())

    
    
    // MARK: - private properties
    
    private let window: UIWindow?
    private let deps: ApplicationDeps = ApplicationDepsImpl.shared
}
