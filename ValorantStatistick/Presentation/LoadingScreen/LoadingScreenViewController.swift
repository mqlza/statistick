//
//  LoadingScreenViewController.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import UIKit

final class LoadingScreenViewController: CommonViewController<LoadingScreenViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
    }
    
    override func bind(viewModel: LoadingScreenViewModel) {
        self.viewModel = viewModel
    }
    
    private var viewModel: LoadingScreenViewModel?

}
