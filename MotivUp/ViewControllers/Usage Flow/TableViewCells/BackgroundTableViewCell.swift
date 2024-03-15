//
//  BackgroundTableViewCell.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import UIKit

class BackgroundTableViewCell: UITableViewCell {
    
    var motivationSentences = UILabel()
    let stackView = UIStackView()
    let BackgroundImageView = UIImageView()
    let BackgroundImageName = UILabel()
    let button = UIButton()
    
    var buttonAction: (() -> Void)?
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    
    
    private func setupUI() {
        contentView.backgroundColor = .systemGray5
        setupStackView()
        setupImageView()
        setupUILabel()
        setupButton()
        setupImageName()
    }
    
    
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.backgroundColor = .clear
        stackView.layer.cornerRadius = 15
        stackView.alignment = .fill
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

        
    private func setupImageView() {
        BackgroundImageView.backgroundColor = .clear
        stackView.addArrangedSubview(BackgroundImageView)
        
        BackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            BackgroundImageView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            BackgroundImageView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            BackgroundImageView.topAnchor.constraint(greaterThanOrEqualTo: stackView.topAnchor),
            BackgroundImageView.bottomAnchor.constraint(lessThanOrEqualTo: stackView.bottomAnchor),
            BackgroundImageView.leadingAnchor.constraint(greaterThanOrEqualTo: stackView.leadingAnchor),
            BackgroundImageView.trailingAnchor.constraint(lessThanOrEqualTo: stackView.trailingAnchor)
        ])
    }
    
    private func setupUILabel() {
        motivationSentences.font = UIFont(name: "Cochin", size: 30)
        motivationSentences.textAlignment = .center
        motivationSentences.isUserInteractionEnabled = false
        motivationSentences.textColor = UIColor(hex: "201B4D") ?? .black
        motivationSentences.backgroundColor = .clear
        motivationSentences.numberOfLines = 0
        motivationSentences.sizeToFit()
        contentView.addSubview(motivationSentences)
        
        motivationSentences.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            motivationSentences.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            motivationSentences.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            motivationSentences.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 45),
            motivationSentences.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45)
        ])
    }
    
    private func setupButton(){
        stackView.addArrangedSubview(button)
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    
    private func setupImageName(){
        BackgroundImageName.backgroundColor = .clear
        BackgroundImageName.textColor = .clear
        BackgroundImageName.translatesAutoresizingMaskIntoConstraints = false
        BackgroundImageView.addSubview(BackgroundImageName)
        
        NSLayoutConstraint.activate([
            BackgroundImageName.centerXAnchor.constraint(equalTo: BackgroundImageView.centerXAnchor),
            BackgroundImageName.centerYAnchor.constraint(equalTo: BackgroundImageView.centerYAnchor)
        ])
    }
      
    
    
    func configureCell(_ imageName: String, motivationSentence: String) {
        BackgroundImageView.image = UIImage(named: imageName)
        motivationSentences.text = motivationSentence
        BackgroundImageName.text = imageName
    }
    
    
    @objc func buttonTapped() {
        buttonAction?()
    }
}
