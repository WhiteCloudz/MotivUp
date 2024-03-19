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
        
        let imageViewLeadingConstraint = imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15)
        
        let textLabelLeadingConstraint = textLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20)
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
