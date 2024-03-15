//
//  ShareTableViewCell.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/14/24.
//

import UIKit

import UIKit

class ShareTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shareImageView: UIImageView!
    @IBOutlet weak var shareSentenceLabel: UILabel!
    let imageName = UILabel()
    
    let button: UIButton = {
           let button = UIButton(type: .system)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    
    var buttonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupImageName()
        setupButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(_ imageName: String, shareSentence: String) {
        shareImageView.image = UIImage(named: imageName)
        shareSentenceLabel.text = shareSentence
        self.imageName.text = imageName
    }
    
    private func setupImageName(){
        imageName.backgroundColor = .clear
        imageName.textColor = .clear
        imageName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageName)
        
        NSLayoutConstraint.activate([
            imageName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    
    private func setupButton() {
        contentView.addSubview(button)
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
                button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
                button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
            buttonAction?()
        }
}
