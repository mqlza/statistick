//
//  LoginScreenViewController.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import UIKit

final class LoginScreenViewController: CommonViewController<LoginScreenViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
    
    }
    
    override func bind(viewModel: LoginScreenViewModel) {
        self.viewModel = viewModel
        viewModel.load()
        imagine.image = viewModel.imagineScrene
        button.setTitle(viewModel.buttonText, for: .normal)
        
    }
    
    private let button = UIButton()
    
    private let scrollView = UIScrollView()
    
    private let pageControl = UIPageControl()
    
    private let indicator = UIActivityIndicatorView()
    
    private let imagine = UIImageView(frame: .zero)
    
    private var viewModel: LoginScreenViewModel?
    
    private func setupView() {
        
        view.backgroundColor = UIColor(red: 15/255, green: 24/255, blue: 34/255, alpha: 1.0)
        
        pageControl.numberOfPages = (viewModel?.labelText.count)!
        pageControl.currentPage = 0
        pageControl.tintColor = .red
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .red
        
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .red
        
        indicator.backgroundColor = .white
        indicator.layer.masksToBounds = false
        indicator.layer.shadowColor = UIColor.black.cgColor
        indicator.layer.shadowOpacity = 0.2
        indicator.layer.shadowOffset = CGSize(width: -1, height: 1)
        indicator.layer.shadowRadius = 5
        indicator.layer.cornerRadius = 26
        
        imagine.layer.cornerRadius = imagine.frame.size.height / 2
        imagine.layer.masksToBounds = true
        imagine.layer.borderWidth = 0
        
        scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * (viewModel?.labelText.count)!, height: 200)
        scrollView.isPagingEnabled = true
        
        view.addSubview(imagine)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.addSubview(button)
        view.addSubview(indicator)
        
        scrollView.delegate = self
        
        addlabel(title1: (viewModel?.labelText[0])!, title2: (viewModel?.secondLabelText[0])!, position: 0)
        addlabel(title1: (viewModel?.labelText[1])!, title2: (viewModel?.secondLabelText[1])!, position: 1)
        addlabel(title1: (viewModel?.labelText[2])!, title2: (viewModel?.secondLabelText[2])!, position: 2)
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func addlabel(title1: String, title2: String, position: CGFloat) {
        
        let label = UILabel()
        label.text = title1
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        
        let secondLabel = UILabel()
        secondLabel.text = title2
        secondLabel.textColor = .white
        secondLabel.textAlignment = .center
        secondLabel.numberOfLines = 3
        
        scrollView.addSubview(label)
        scrollView.addSubview(secondLabel)
        
        let screenWidth = UIScreen.main.bounds.width
        label.frame = CGRect(x: screenWidth * position, y: 20, width: screenWidth, height: 100)
        secondLabel.frame = CGRect(x: screenWidth * position, y: 40, width: screenWidth, height: 200)
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        
        self.viewModel?.setUser()
        
        button.layer.opacity = 0.5
        button.backgroundColor = .systemGray
        
        indicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [self] in UIActivityIndicatorView().stopAnimating()
            
            self.indicator.removeFromSuperview()
            
            button.layer.opacity = 1
            button.backgroundColor = .red
            
            let base = BaseRouter(window: UIApplication.shared.keyWindow)
            base.tab()
        })
    }
    
    private func setupConstraint() {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        imagine.translatesAutoresizingMaskIntoConstraints = false
        indicator.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//
            indicator.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 130),
            indicator.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -130),
            indicator.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -380),
            indicator.topAnchor.constraint(equalTo: view.topAnchor, constant: 380),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 790),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
            
            imagine.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            imagine.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            imagine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 90),
            imagine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -90),
        
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            pageControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 750),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 550),
            scrollView.heightAnchor.constraint(equalToConstant: 200)
        
        ])
        
    }

}

extension LoginScreenViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
