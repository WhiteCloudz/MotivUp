//
//  UpdateTableViewCell.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/18/24.
//


import UIKit

    class UpdateTableViewCell: UITableViewCell {
        let stackView = UIStackView()
        let settingsLabel = UILabel()
        let nameButton = UIButton()
        let emotionButton = UIButton()
        let backgroundButton = UIButton()
        let nilButton = UIButton()

        var nameButtonAction: (() -> Void)?
        var emotionButtonAction: (() -> Void)?
        var backgroundButtonAction: (() -> Void)?

        
        
        override func setSelected(_ selected: Bool, animated: Bool) {
                super.setSelected(selected, animated: animated)
                stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
                setupUI()
            }
        
        
        private func setupUI(){
            contentView.backgroundColor = .systemGray5
            setupStackView()
            setupSettingsLabel()
            setupButtons()
            
        }

        
        
        
        private func setupStackView() {
            stackView.axis = .vertical
            stackView.spacing = 10
            stackView.backgroundColor = .systemGray5
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            contentView.addSubview(stackView)
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 3),
                stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        }
        
        private func setupSettingsLabel(){
           
            settingsLabel.textAlignment = .left
            settingsLabel.text = "Settings"
            settingsLabel.font = UIFont(name: "Cochin", size: CGFloat(30))
            settingsLabel.textColor = UIColor(hex: "201B4D") ?? .black
            settingsLabel.backgroundColor = .clear
            settingsLabel.numberOfLines = 0
                stackView.addArrangedSubview(settingsLabel)
            }
        
        private func setupButtons(){
            
            
            addButtons(button: nameButton, stackView: stackView, buttonName: "Edit Name", titleColor: UIColor(hex: "201B4D") ?? .black, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 10, iconName: "pencil", action:  #selector(editName))

            addButtons(button: emotionButton, stackView: stackView, buttonName: "Update Emotion", titleColor: UIColor(hex: "201B4D") ?? .black, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 10, iconName: "checkmark.circle", action:  #selector(updateEmotion))
            
            addButtons(button: backgroundButton, stackView: stackView, buttonName: "Change Background", titleColor: UIColor(hex: "201B4D") ?? .black, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 10, iconName: "photo.on.rectangle.angled", action:  #selector(updateBackgroundImage))
    
        }
        
        
       
        
        @objc func editName(){
            nameButtonAction?()
        }
        
        @objc func updateEmotion(){
            emotionButtonAction?()
        }
        
        
        @objc func updateBackgroundImage(){
            backgroundButtonAction?()
        }
        
        
        
        func configureCell(nameButtonAction: (() -> Void)?, emotionButtonAction: (() -> Void)?, backgroundButtonAction: (() -> Void)?) {
           
            self.nameButtonAction = nameButtonAction
            self.emotionButtonAction = emotionButtonAction
            self.backgroundButtonAction = backgroundButtonAction
        }
    
        
        
        
        private func addButtons(button: UIButton, stackView: UIStackView, buttonName: String, titleColor: UIColor, backgroundColor: UIColor, layerValue: Int, iconName: String, action: Selector) {
            let containerView = UIView()
            
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.backgroundColor = .clear
            imageView.tintColor = titleColor
            imageView.image = UIImage(systemName: iconName)
            
            imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.text = buttonName
            textLabel.backgroundColor = .clear
            
            containerView.addSubview(imageView)
            containerView.addSubview(textLabel)
            
            // imageView ile containerView arasındaki boşluk için düzeltilmiş kısıtlama
            let imageViewLeadingConstraint = imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
            
            let textLabelLeadingConstraint = textLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 30)
            let textLabelTrailingConstraint = textLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            let textLabelCenterYConstraint = textLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            
            NSLayoutConstraint.activate([
                imageViewLeadingConstraint,
                imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                textLabelLeadingConstraint,
                textLabelTrailingConstraint,
                textLabelCenterYConstraint
            ])
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = backgroundColor
            button.layer.cornerRadius = CGFloat(layerValue)
            containerView.addSubview(button)
            
            // button için kısıtlamalar
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: containerView.topAnchor),
                button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
            button.addTarget(self, action: action, for: .touchUpInside)
            
            stackView.addArrangedSubview(containerView)
        }
        
    }
