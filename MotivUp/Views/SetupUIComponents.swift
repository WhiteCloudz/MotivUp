//
//  SetupUIComponents.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import UIKit
import Foundation


extension UIViewController {
    
   func addVerticalStack(stackName: UIStackView, spacing: Int, backgrounColor: UIColor, layerValue: Int){
        stackName.axis = .vertical
        stackName.spacing = CGFloat(spacing)
        stackName.backgroundColor = backgrounColor
        stackName.layer.cornerRadius = stackName.bounds.height / CGFloat(layerValue)
        stackName.distribution = .fillEqually
    }
    
    public func addHorizontalStack(stackName: UIStackView, spacing: Int){
        stackName.axis = .horizontal
        stackName.spacing = CGFloat(spacing)
        stackName.distribution = .fillEqually
    }
    
    public func addImageView(imageView: UIImageView, imageName: String, stackView: UIStackView){
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(imageView)
    }
    
    public func addImageViewForView(imageView: UIImageView, imageName: String, uiView: UIView){
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        uiView.addSubview(imageView)
    }
    
    public func addNilLabel (stackView: UIStackView){
        let nilLabel = UILabel()
        nilLabel.backgroundColor = .clear
        stackView.addArrangedSubview(nilLabel)
    }
    
    
    public func addUITextView(textView: UITextView, stackView:UIStackView, fontSize: Int, textColor: UIColor, backgrounColor: UIColor, message:String){
        textView.text = message
        textView.textAlignment = .center
        textView.center = CGPoint(x: textView.frame.width / 2, y: textView.frame.height / 2)
        textView.isUserInteractionEnabled = false
        textView.textColor = textColor
        textView.font = UIFont(name: "Cochin", size: CGFloat(fontSize))
        textView.backgroundColor = backgrounColor
        stackView.addArrangedSubview(textView)
    }
    
    public func addTextField (textField: UITextField, stackView: UIStackView, placeHolder: String, fontSize: Int, textColor: UIColor, backgrounColor: UIColor) {
        textField.textAlignment = .center
        textField.placeholder = placeHolder
        textField.font = UIFont(name: "Cochin", size: CGFloat(fontSize))
        textField.textColor = textColor
        textField.borderStyle = .roundedRect
        textField.backgroundColor = backgrounColor
        stackView.addArrangedSubview(textField)
    }

    
    public func addButton(button: UIButton, stackView: UIStackView, buttonName: String, titleColor: UIColor, backgroundColor: UIColor, layerValue: Int, iconName: String, action: Selector) {
        button.setTitleColor(titleColor, for: .normal)
        button.setTitle(buttonName, for: .normal)
        button.backgroundColor = backgroundColor
        button.tintColor = titleColor // İç rengi burada belirliyoruz
        button.layer.cornerRadius = CGFloat(layerValue)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.setImage(UIImage(systemName: iconName), for: .normal)
        stackView.addArrangedSubview(button)
    }
    
    
    public func addButtonWithSelectColor(button: UIButton, stackView: UIStackView, buttonName: String, titleColor: UIColor, selectControl:String, backgroundColor: UIColor, selectedBackgroundColur: UIColor, layerValue: Int, iconName: String, action: Selector) {
              button.setTitleColor(titleColor, for: .normal)
              button.setTitle(buttonName, for: .normal)
              if selectControl ==  buttonName {
                 button.backgroundColor = selectedBackgroundColur
             }else {
                 button.backgroundColor = backgroundColor
             }
              button.layer.cornerRadius = CGFloat(layerValue)
              button.addTarget(self, action: action, for: .touchUpInside)
              button.setImage(UIImage(systemName: iconName), for: .normal)
              stackView.addArrangedSubview(button)
          }
    
    public func addButtonWithIcone(button: UIButton, stackView: UIStackView, buttonName: String, titleColor: UIColor, backgroundColor: UIColor, layerValue: Int, iconName: String, action: Selector) {
        let containerView = UIView()
           containerView.backgroundColor = .clear
           
           let iconImageView = UIImageView(image: UIImage(systemName: iconName))
           iconImageView.tintColor = titleColor
           iconImageView.contentMode = .scaleAspectFit
           containerView.addSubview(iconImageView)
           
           let titleLabel = UILabel()
           titleLabel.text = buttonName
           titleLabel.textColor = titleColor
           containerView.addSubview(titleLabel)
           
           button.addSubview(containerView)
           
           containerView.translatesAutoresizingMaskIntoConstraints = false
           iconImageView.translatesAutoresizingMaskIntoConstraints = false
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               containerView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 25),
               containerView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -25),
               containerView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
               
               iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
               iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
               
               titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 25), // Sabit bir boşluk bırakmak için 10 değeri kullanılabilir
               titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
               titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
           ])
           
           button.setTitleColor(titleColor, for: .normal)
           button.backgroundColor = backgroundColor
           button.layer.cornerRadius = CGFloat(layerValue)
           button.addTarget(self, action: action, for: .touchUpInside)
           
           // containerView'ın genişliğini butonun genişliğine göre ayarla
           button.contentHorizontalAlignment = .fill
           button.contentVerticalAlignment = .fill
           
           stackView.addArrangedSubview(button)
    }
    
    public func addUILabel(label: UILabel, stackView: UIStackView, text: String, fontSize: Int, textColor: UIColor,textAlignment:NSTextAlignment , backgrounColor: UIColor){
            label.textAlignment = textAlignment
            label.text = text
            label.font = UIFont(name: "Cochin", size: CGFloat(fontSize))
            label.textColor = textColor
            label.backgroundColor = backgrounColor
            label.numberOfLines = 0
            stackView.addArrangedSubview(label)
        }
    
    public func addUIView(uiView: UIView, layerValue: Int){
        uiView.backgroundColor = .clear
        uiView.layer.cornerRadius = uiView.bounds.height / CGFloat(layerValue)
        uiView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func addBackgroundView(UIStackView: UIStackView, backgroundColor : UIColor,  layerValue: Int){
        let backgroundView = UIView()
        backgroundView.layer.cornerRadius = CGFloat(layerValue)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.clipsToBounds = true
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        UIStackView.insertSubview(backgroundView, at: 0)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: UIStackView.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: UIStackView.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: UIStackView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: UIStackView.trailingAnchor),
        ])
    }
    
    
    public func addTimePicker(pickerName:UIDatePicker, stackView:UIStackView,tintColor:UIColor, date:Date?, action: Selector ){
        pickerName.datePickerMode = .time
        pickerName.addTarget(self, action: action, for: .valueChanged)
        pickerName.tintColor = tintColor
        pickerName.setValue(UIColor(hex: "40288E") ?? .black, forKeyPath: "textColor")
        if let startDate = date {
            pickerName.setDate(startDate, animated: true)
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm a"
            if let defaultDate = dateFormatter.date(from: "00:00 AM") {
                pickerName.setDate(defaultDate, animated: true)
            }
        }
        pickerName.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(pickerName)
    }
    
    
}
