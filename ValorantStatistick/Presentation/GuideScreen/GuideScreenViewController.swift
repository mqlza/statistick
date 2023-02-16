//
//  GuideScreenViewController.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import UIKit

final class GuideScreenViewController: CommonViewController<GuideScreenViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupView()
        setupConstraint()
        getVideo(videoCode: "RmHqOSrkZnk")
    }
    
    override func bind(viewModel: GuideScreenViewModel) {
        self.viewModel = viewModel
    }
    
    private let webView = UIWebView()
    
    private var viewModel: GuideScreenViewModel?
    
    private func setupView() {
        
        view.backgroundColor = UIColor(red: 15/255, green: 24/255, blue: 34/255, alpha: 1.0)
        
        view.addSubview(webView)

    }

    private func setupConstraint() {
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600)
        
        ])
    }
    
    private func getVideo(videoCode: String) {
        
        let url = URL(string: "https://youtu.be/\(videoCode)")
        webView.loadRequest(URLRequest(url: url!))
    }
    
}
