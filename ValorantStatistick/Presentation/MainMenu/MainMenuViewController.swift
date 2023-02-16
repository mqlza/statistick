//
//  MainMenuViewController.swift
//  ValorantStatistick
//
//  Created by Георгий on 12.10.2022.
//

import UIKit

final class MainMenuViewController: CommonViewController<MainMenuViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        setupColors()
        setupTable()
        slideUpView.isScrollEnabled = true
        slideUpView.delegate = self
        slideUpView.dataSource = self
        slideUpView.register(SlideUpViewCell.self,
                             forCellReuseIdentifier: "SlideUpViewCell")
    }
    
    override func bind(viewModel: MainMenuViewModel) {
        self.viewModel = viewModel
        viewModel.setDataSet()
        viewModel.load()
        nickname.text = viewModel.nickname
        place.text = viewModel.place
        rank.text = viewModel.rank
        winRate.text = viewModel.winRate
        scoreKDA.text = viewModel.scoreKDA
        lastTen.text = viewModel.lastTen
        lastTenScore.text = viewModel.lastTenScore
        lastTenKDA.text = viewModel.lastTenKDA
        lastTenTotal.text = viewModel.lastTenTotal
        mostPlayed.text = viewModel.mostPlayed
        menu.setTitle(viewModel.buttonMenu, for: .normal)
        profileImg.image = viewModel.profileImg
        rankImg.image = viewModel.rankImg
    }
    
    private let tableView = UITableView()
    
    private let selectFiltr: MatchType? = nil
    
    private var counter = 0
    
    private let nickname = UILabel()
    
    private let place = UILabel()
    
    private let rank = UILabel()
    
    private let winRate = UILabel()
    
    private let scoreKDA = UILabel()
    
    private let menu = UIButton()
    
    private let containerView = UIView()
    
    private let slideUpView = UITableView()
    
    private let slideUpViewHeight: CGFloat = 200
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 400)
    }
    
    private let lastTen = UILabel()
    
    private let lastTenKDA = UILabel()
    
    private let lastTenScore = UILabel()
    
    private let lastTenTotal = UILabel()
    
    private let mostPlayed = UILabel()
    
    let slideUpViewDataSource = ["Competitive", "Unranted", "Spike Rush", "DeathMatch"]
    
    private let profileImg = UIImageView(frame: .zero)
    
    private let rankImg = UIImageView(frame: .zero)
    
    private let mostChar = UIStackView()
    
    private let scrollView = UIScrollView()
    
    private let matchStatStack = UIStackView()
    
    private var dataSet: [Match] = []
    
    var diplayData: [Match] {
        guard let type = selectFiltr else { return dataSet }
        return dataSet.filter { $0.type == type }
    }
    
    private var viewModel: MainMenuViewModel?
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 15/255, green: 24/255, blue: 34/255, alpha: 1.0)
        
        tableView.register(MatchTableViewCell.self, forCellReuseIdentifier: "matchCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemBlue
        
        nickname.textColor = .white
        nickname.font = UIFont.boldSystemFont(ofSize: 26)
        
        place.textColor = .white
        place.font = UIFont.systemFont(ofSize: 14)
        
        rank.textColor = .white
        rank.font = UIFont.boldSystemFont(ofSize: 18)
        
        winRate.textColor = .white
        winRate.font = UIFont.systemFont(ofSize: 18)
        
        scoreKDA.textColor = .white
        scoreKDA.font = UIFont.systemFont(ofSize: 18)
        
        lastTen.textColor = .white
        lastTen.font = UIFont.systemFont(ofSize: 14)
        
        lastTenKDA.textColor = .white
        lastTenKDA.font = UIFont.systemFont(ofSize: 16)
        
        lastTenTotal.textColor = .white
        lastTenTotal.font = UIFont.boldSystemFont(ofSize: 16)
        
        mostPlayed.textColor = .white
        mostPlayed.font = UIFont.systemFont(ofSize: 14)
        
        lastTenScore.textColor = .white
        lastTenScore.font = UIFont.systemFont(ofSize: 16)
        
        scrollView.backgroundColor = UIColor(red: 15/255, green: 24/255, blue: 34/255, alpha: 1.0)
        scrollView.contentSize = contentSize
        
        matchStatStack.axis = .vertical
        matchStatStack.alignment = .fill
        matchStatStack.spacing = 8
        
        mostChar.axis = .horizontal
//        mostChar.alignment = .center
        mostChar.spacing = 8
        
        profileImg.layer.cornerRadius = 12
        profileImg.clipsToBounds = true
        profileImg.layer.borderColor = UIColor.white.cgColor
        profileImg.layer.borderWidth = 1
        
        menu.backgroundColor = UIColor(red: 15/255, green: 34/255, blue: 60/255, alpha: 1.0)
        
        view.addSubview(scrollView)
        scrollView.addSubview(matchStatStack)
        view.addSubview(tableView)
        view.addSubview(mostChar)
        view.addSubview(mostChar)
        view.addSubview(nickname)
        view.addSubview(place)
        view.addSubview(rank)
        view.addSubview(winRate)
        view.addSubview(scoreKDA)
        view.addSubview(profileImg)
        view.addSubview(rankImg)
        view.addSubview(menu)
        view.addSubview(lastTen)
        view.addSubview(lastTenKDA)
        view.addSubview(lastTenScore)
        view.addSubview(lastTenTotal)
        view.addSubview(mostPlayed)
       
        menu.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
     let window = UIApplication.shared.keyWindow
     containerView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
     containerView.frame = self.view.frame
        
        let tapGesture = UITapGestureRecognizer(target: self,
        action: #selector(slideUpViewTapped))
        containerView.addGestureRecognizer(tapGesture)
        
        let screenSize = UIScreen.main.bounds.size
        slideUpView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: slideUpViewHeight)
        slideUpView.separatorStyle = .none
        
        containerView.alpha = 0
        UIView.animate(withDuration: 0.5,
                       delay: 0, usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut, animations: {
          self.containerView.alpha = 0.8
          self.slideUpView.frame = CGRect(x: 0, y: screenSize.height - self.slideUpViewHeight, width: screenSize.width, height: self.slideUpViewHeight)
        }, completion: nil)
        
        window?.addSubview(containerView)
        window?.addSubview(slideUpView)
    }
    
    @objc func slideUpViewTapped() {
        
        let screenSize = UIScreen.main.bounds.size
         UIView.animate(withDuration: 0.5,
                        delay: 0, usingSpringWithDamping: 1.0,
                        initialSpringVelocity: 1.0,
                        options: .curveEaseInOut, animations: {
           self.containerView.alpha = 0
           self.slideUpView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.slideUpViewHeight)
         }, completion: nil)
    }
    
    class SlideUpViewCell: UITableViewCell {
      lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0,
                                 width: self.frame.width, height: 50))
        return view
    }()

      lazy var labelView: UILabel = {
        let view = UILabel(frame: CGRect(x: 60, y: 10,
                              width: self.frame.width - 75, height: 30))
        return view
    }()
      override func awakeFromNib() {
        super.awakeFromNib()
      }
      override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(labelView)
        // Configure the view for the selected state
      }
    }
    


    private func setupConstraint() {
        
        nickname.translatesAutoresizingMaskIntoConstraints = false
        place.translatesAutoresizingMaskIntoConstraints = false
        rank.translatesAutoresizingMaskIntoConstraints = false
        winRate.translatesAutoresizingMaskIntoConstraints = false
        scoreKDA.translatesAutoresizingMaskIntoConstraints = false
        menu.translatesAutoresizingMaskIntoConstraints = false
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        rankImg.translatesAutoresizingMaskIntoConstraints = false
        lastTen.translatesAutoresizingMaskIntoConstraints = false
        lastTenKDA.translatesAutoresizingMaskIntoConstraints = false
        lastTenTotal.translatesAutoresizingMaskIntoConstraints = false
        lastTenScore.translatesAutoresizingMaskIntoConstraints = false
        mostPlayed.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        matchStatStack.translatesAutoresizingMaskIntoConstraints = false
        mostChar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 430),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            lastTen.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            lastTen.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            lastTenScore.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            lastTenScore.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            lastTenKDA.topAnchor.constraint(equalTo: view.topAnchor, constant: 370),
            lastTenKDA.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            lastTenTotal.topAnchor.constraint(equalTo: view.topAnchor, constant: 390),
            lastTenTotal.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            mostPlayed.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            mostPlayed.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
            
            mostChar.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            mostChar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -520),
            mostChar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 270),
            mostChar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            menu.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            menu.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            menu.topAnchor.constraint(equalTo: view.topAnchor, constant: 260),
            menu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620),
        
            profileImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            profileImg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -700),
            profileImg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            profileImg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -290),
        
            nickname.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            nickname.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 160),
            
            place.topAnchor.constraint(equalTo: view.topAnchor, constant: 115),
            place.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 160),
            
            rankImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            rankImg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -678),
            rankImg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 130),
            rankImg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -190),
            
            rank.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            rank.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 220),
            
            scoreKDA.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            scoreKDA.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 220),
            
            winRate.topAnchor.constraint(equalTo: view.topAnchor, constant: 210),
            winRate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 220),
            
            matchStatStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            matchStatStack.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            matchStatStack.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            matchStatStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
            
        ])
    }
    
    private func setupTable() {
        let charImg = [viewModel?.charImgTable[0], viewModel?.charImgTable[1]]
        
        let procent = [viewModel?.procent[0], viewModel?.procent[1]]
        
        for index in 0..<2 {
            
            let view = UIView()
            
            let charImgView = UIImageView()
            
            let procentLabel = UILabel()
            
            charImgView.image = charImg[index % charImg.count]
            charImgView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
            
            procentLabel.text = procent[index % procent.count]
            procentLabel.textColor = .white
            procentLabel.font = UIFont.systemFont(ofSize: 14)
            procentLabel.frame = CGRect(x: 3, y: 45, width: 50, height: 20)
            
            
            for view in mostChar.arrangedSubviews {
//                label.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    view.widthAnchor.constraint(equalToConstant: 50),
                    view.heightAnchor.constraint(equalToConstant: 80),
                ])
        }
        
            mostChar.addArrangedSubview(view)
            view.addSubview(charImgView)
            view.addSubview(procentLabel)
        }
    }

    private func setupColors() {

        let scoreTable = [viewModel?.scoreTable[0], viewModel?.scoreTable[1], viewModel?.scoreTable[2], viewModel?.scoreTable[3], viewModel?.scoreTable[4], viewModel?.scoreTable[5], viewModel?.scoreTable[6], viewModel?.scoreTable[7], viewModel?.scoreTable[8], viewModel?.scoreTable[9]]

        let kdaTable = [viewModel?.kdaTable[0], viewModel?.kdaTable[1], viewModel?.kdaTable[2], viewModel?.kdaTable[3], viewModel?.kdaTable[4], viewModel?.kdaTable[5], viewModel?.kdaTable[6], viewModel?.kdaTable[7], viewModel?.kdaTable[8], viewModel?.kdaTable[9]]

        let matchScoreTable = [viewModel?.matchScoreTable[0], viewModel?.matchScoreTable[1], viewModel?.matchScoreTable[2], viewModel?.matchScoreTable[3], viewModel?.matchScoreTable[4], viewModel?.matchScoreTable[5], viewModel?.matchScoreTable[6], viewModel?.matchScoreTable[7], viewModel?.matchScoreTable[8], viewModel?.matchScoreTable[9]]

        let regime = [viewModel?.regime[0], viewModel?.regime[1], viewModel?.regime[2], viewModel?.regime[3]]

        let mapTable = [viewModel?.mapTable[0], viewModel?.mapTable[1], viewModel?.mapTable[2], viewModel?.mapTable[3], viewModel?.mapTable[4], viewModel?.mapTable[5], viewModel?.mapTable[6]]

        let timeTable = [viewModel?.timeTable[0], viewModel?.timeTable[1], viewModel?.timeTable[2], viewModel?.timeTable[3], viewModel?.timeTable[4], viewModel?.timeTable[5], viewModel?.timeTable[6], viewModel?.timeTable[7], viewModel?.timeTable[8], viewModel?.timeTable[9]]

        let charImgTable = [viewModel?.charImgTable[0], viewModel?.charImgTable[1], viewModel?.charImgTable[2], viewModel?.charImgTable[3], viewModel?.charImgTable[4]]

        for index in 0..<10 {

            let view = UIView()

            let label = UILabel()

            let kdaTableLabel = UILabel()

            let matchScoreTableLabel = UILabel()

            let regimeLabel = UILabel()

            let mapTableLabel = UILabel()

            let timeTableLabel = UILabel()

            let charImgTableView = UIImageView()

            view.backgroundColor = UIColor(red: 15/255, green: 24/255, blue: 50/255, alpha: 1.0)

            charImgTableView.image = charImgTable[index % charImgTable.count]
            charImgTableView.frame = CGRect(x: 20, y: 10, width: 80, height: 80)

            label.text = scoreTable[index % scoreTable.count]
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.frame = CGRect(x: 130, y: 25, width: 100, height: 20)

            kdaTableLabel.text = kdaTable[index % kdaTable.count]
            kdaTableLabel.textColor = .white
            kdaTableLabel.font = UIFont.boldSystemFont(ofSize: 18)
            kdaTableLabel.frame = CGRect(x: 130, y: 55, width: 100, height: 20)

            matchScoreTableLabel.text = matchScoreTable[index % matchScoreTable.count]
            matchScoreTableLabel.textColor = .white
            matchScoreTableLabel.font = UIFont.boldSystemFont(ofSize: 24)
            matchScoreTableLabel.frame = CGRect(x: 220, y: 40, width: 100, height: 20)
            matchScoreTableLabel.textAlignment = .center

            regimeLabel.text = regime[index % regime.count]
            regimeLabel.textColor = .white
            regimeLabel.font = UIFont.systemFont(ofSize: 14)
            regimeLabel.frame = CGRect(x: 335, y: 22, width: 100, height: 20)

            if regimeLabel.text == "Competitive" {
                regimeLabel.textColor = .red
            } else if regimeLabel.text == "Unranked" {
            regimeLabel.textColor = .cyan
            } else if regimeLabel.text == "Spike Rush" {
                regimeLabel.textColor = .green
            } else {
                regimeLabel.textColor = .yellow
            }

            mapTableLabel.text = mapTable[index % mapTable.count]
            mapTableLabel.textColor = .systemBlue
            mapTableLabel.font = UIFont.systemFont(ofSize: 14)
            mapTableLabel.frame = CGRect(x: 335, y: 42, width: 100, height: 20)

            timeTableLabel.text = timeTable[index % timeTable.count]
            timeTableLabel.textColor = .white
            timeTableLabel.font = UIFont.systemFont(ofSize: 14)
            timeTableLabel.frame = CGRect(x: 335, y: 62, width: 100, height: 20)

            for view in matchStatStack.arrangedSubviews {
                NSLayoutConstraint.activate([
                    view.widthAnchor.constraint(equalToConstant: 420),
                    view.heightAnchor.constraint(equalToConstant: 100),
                ])
        }

            matchStatStack.addArrangedSubview(view)
            view.addSubview(label)
            view.addSubview(charImgTableView)
            view.addSubview(kdaTableLabel)
            view.addSubview(matchScoreTableLabel)
            view.addSubview(regimeLabel)
            view.addSubview(mapTableLabel)
            view.addSubview(timeTableLabel)
    }
    }

      
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

//extension MainMenuViewController: UITableViewDelegate, UITableViewDataSource {
//
//  func tableView(_ tableView: UITableView, numberOfRowsInSection
//         section: Int) -> Int {
//    slideUpViewDataSource.count
//  }
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath:
//         IndexPath) -> UITableViewCell {
//    guard let cell = tableView
//      .dequeueReusableCell(withIdentifier: "SlideUpViewCell",
//      for: indexPath) as? SlideUpViewCell
//    else { fatalError("unable to deque SlideUpViewCell") }
//
//      cell.labelView.text = slideUpViewDataSource[indexPath.row]
//  return cell
//}
//  func tableView(_ tableView: UITableView, heightForRowAt
//         indexPath: IndexPath) -> CGFloat {
//    return 50
//  }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        menu.setTitle(slideUpViewDataSource[indexPath.row], for: .normal)
//    }
//}

extension MainMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let selected = diplayData[indexPath.row]
       
        tableView.reloadData()
    }
}

extension MainMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        diplayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as! MatchTableViewCell
        cell.setupCell(match: diplayData[indexPath.row])
        return cell
    }
    
}
