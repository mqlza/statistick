//
//  MatchTableViewCell.swift
//  ValorantStatistick
//
//  Created by Георгий on 11.11.2022.
//

import Foundation
import UIKit

class MatchTableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    var agent: String = ""
    var score: String = ""
    
    func setupCell(match: Match) {
        
        agent = match.agent
        score = match.score
        contentView.backgroundColor = match.type == .competitive ? .red : .yellow
        setupView()
        setupConstraint()
    }
    
    var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    var agentLabel: UILabel = {
        let agentLabel = UILabel()
        agentLabel.textColor = .black
        agentLabel.font = UIFont.systemFont(ofSize: 16)
        return agentLabel
    }()
    
    var scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.textColor = .black
        scoreLabel.font = UIFont.systemFont(ofSize: 16)
        scoreLabel.textAlignment = .left
        return scoreLabel
    }()
    
    var playerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        return stack
    }()
    
    func setupView() {
        contentView.addSubview(stack)
        stack.addArrangedSubview(playerStack)
        playerStack.addArrangedSubview(agentLabel)
        playerStack.addArrangedSubview(scoreLabel)
        agentLabel.text = agent
        scoreLabel.text = score
        selectionStyle = .none
    }
    
    func setupConstraint() {
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 50),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50)
        ])
    }
}
