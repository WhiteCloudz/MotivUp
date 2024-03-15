//
//  FirstViewController.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import UIKit
import CoreData

class FirstViewController: UIViewController {
    
    let backgrounView = UIView()
    let mainVStack = UIStackView()
    
    let tapVStack = UIStackView()
    let image = UIImageView()
    
    let middileVStack = UIStackView()
    var messageTextLabel: UILabel = UILabel ()
    let bottomVStack = UIStackView()
    var startButton = UIButton ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
    }
    
        
    private func setupUI() {
        
            setupBackroundImageToVievController(imageNamed: "background", backgroundView: backgrounView)
            view.addSubview(backgrounView)
            backgrounView.translatesAutoresizingMaskIntoConstraints = false
            setupBackgroundViewLayout(backgroundView: backgrounView)
      
            addVerticalStack(stackName: mainVStack, spacing: 30, backgrounColor: .clear, layerValue: 0) // Main Stack View
            mainVStack.translatesAutoresizingMaskIntoConstraints = false
            backgrounView.addSubview(mainVStack)
            setupLayoutSquare(whereTo: view as Any, object: mainVStack, valueTop: 150, valueDown: 120, valueLeft: 15, valueRight: 15) // Main Stack Layout
    
            addVerticalStack(stackName: tapVStack, spacing: 30, backgrounColor: .clear, layerValue: 0)  // Tap Stack View
            mainVStack.addArrangedSubview(tapVStack)
            addImageView(imageView: image, imageName: "first", stackView: tapVStack)
        
        
            addVerticalStack(stackName: middileVStack, spacing: 0, backgrounColor: .clear, layerValue: 0) // Middile Stack View
            mainVStack.addArrangedSubview(middileVStack)
            
        
            addUILabel(label: messageTextLabel, stackView: middileVStack, text: " Are you ready to discover your potential?", fontSize: 33, textColor: UIColor(hex: "40288E") ?? .black, textAlignment: .center, backgrounColor: .clear)
            setupLayoutLeftAndRight(whereTo: mainVStack, object: messageTextLabel, valueLeft: 10, valueRight: 5) // Text View Layout
        
        
           addVerticalStack(stackName: bottomVStack, spacing: 15, backgrounColor: .clear, layerValue: 0) // Bottom Stack View
            mainVStack.addArrangedSubview(bottomVStack)
            addNilLabel(stackView: bottomVStack)
            addButton(button: startButton, stackView: bottomVStack, buttonName: "Start", titleColor:  .systemGray6 , backgroundColor: UIColor(hex: "40288E") ?? .black, layerValue: 15,iconName: "", action: #selector(startButtonTapped))
            setupLayoutLeftAndRight(whereTo: mainVStack, object: startButton, valueLeft: 40, valueRight: 40)
            addNilLabel(stackView: bottomVStack)
    
    }
    
  
    @objc func startButtonTapped() {
        let updateResult = DataManager.shared.startApp()
        
        if updateResult {
            let setupNameVC = SetupNameViewController()
            self.navigationController?.pushViewController(setupNameVC, animated: true)
        } else {
            showAlert(title: "Error", message: "Data could not be saved.")
        }
    }
    
  
}
