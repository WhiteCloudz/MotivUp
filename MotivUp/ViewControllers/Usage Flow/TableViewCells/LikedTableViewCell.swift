//
//  LikedTableViewCell.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import UIKit

class LikedTableViewCell: UITableViewCell {
    
    var likedSentences = UILabel()
    let stackView = UIStackView()
    var motivationID:String?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .systemGray6
        setupTextView()
        setupStackView()
    }
    
    private func setupTextView() {
        let text = likedSentences.text ?? ""
        let length = text.count
        var fontSize: CGFloat = 0
        
        if length < 100 {
            fontSize = 25
        } else if length >= 100 && length < 150 {
            fontSize = 22
        } else if length >= 150 && length <= 200 {
            fontSize = 18
        } else {
            fontSize = 16
        }

        likedSentences.font = UIFont(name: "Cochin", size: fontSize)
        likedSentences.textAlignment = .center
        likedSentences.isUserInteractionEnabled = false
        likedSentences.textColor = UIColor(hex: "201B4D") ?? .black
        likedSentences.backgroundColor = .clear
        likedSentences.numberOfLines = 0
        likedSentences.sizeToFit()
        stackView.addArrangedSubview(likedSentences)
    }
    
    
    
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = UIColor.systemBrown.withAlphaComponent(0.1)
        stackView.layer.cornerRadius = 8
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configureCell(_ motivation: Motivation) {
        likedSentences.text = motivation.motivationSentences
        motivationID = motivation.motivationID
        
    }
   
}
