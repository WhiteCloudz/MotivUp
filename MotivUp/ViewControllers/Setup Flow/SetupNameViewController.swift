//
//  SetupNameViewController.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import UIKit
import CoreData

class SetupNameViewController: UIViewController, UITextFieldDelegate {
    
    let backgroundView = UIView()
    let mainVStack = UIStackView()
    let subMainStack = UIStackView()
    let subMainStackTwo = UIStackView()
    
    var messageTextLabel: UILabel = UILabel ()
    var nameTextField: UITextField = UITextField()
    let image = UIImageView()
    
    var continueButton = UIButton ()
    var skipButton = UIButton ()
    var navicationControl:String = ""
    
    var userName:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData ()
        
        
    }
    
    
    private func setupUI() {
    
        setupBackroundImageToVievController(imageNamed: "background", backgroundView: backgroundView)
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        setupBackgroundViewLayout(backgroundView: backgroundView)
        
        addVerticalStack(stackName: mainVStack, spacing: 25, backgrounColor: .clear, layerValue: 0) // Main Stack
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(mainVStack)
        setupLayoutSquare(whereTo: view as Any, object: mainVStack, valueTop: 50, valueDown: 20, valueLeft: 25, valueRight: 25) // Main Stack Layout
        addNilLabel(stackView: mainVStack) // For layout. Nil.
        setupImageAndMessage()
        setupTextField()
        setupButtons()
        addNilLabel(stackView: mainVStack) // For layout. Nil.
        
    }
    
    private func setupImageAndMessage(){
        addImageView(imageView: image, imageName: "name", stackView: mainVStack) // Image View
        setupLayoutLeftAndRight(whereTo: mainVStack, object: image, valueLeft: 20, valueRight: 15)
        
        addUILabel(label: messageTextLabel, stackView: mainVStack, text: " How would you like us to address you?", fontSize: 32, textColor: UIColor(hex: "40288E") ?? .black, textAlignment: .center, backgrounColor: .clear)
        setupLayoutLeftAndRight(whereTo: mainVStack, object: messageTextLabel, valueLeft: 20, valueRight: 15) // Text View Layout
    }
    
    
    private func setupTextField(){
        addVerticalStack(stackName: subMainStack, spacing: 10, backgrounColor: .clear, layerValue: 0)
        mainVStack.addArrangedSubview(subMainStack)
        
        nameTextField.delegate = self
        addTextField(textField: nameTextField, stackView: subMainStack, placeHolder: "Your Name", fontSize: 28, textColor: UIColor(hex: "40288E") ?? .black, backgrounColor: UIColor.systemGray6.withAlphaComponent(1.2))  // TextField
        
        setupLayoutLeftAndRight(whereTo: mainVStack, object: nameTextField, valueLeft: 25, valueRight: 25) // Setup TextField Layout
        
        addNilLabel(stackView: subMainStack) // For layout. Nil.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() 
            return true
        }

        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    
    private func setupButtons(){
        addVerticalStack(stackName: subMainStackTwo, spacing: 10, backgrounColor: .clear, layerValue: 0) // for Continue and Skip Button
        mainVStack.addArrangedSubview(subMainStackTwo)
        
        addButton(button: continueButton, stackView: subMainStackTwo, buttonName: "Continue", titleColor: .systemGray6, backgroundColor: UIColor(hex: "40288E") ?? .lightGray, layerValue: 15, iconName: "", action:  #selector(startButtonTapped)) // Continue Button
        setupLayoutLeftAndRight(whereTo: mainVStack, object: continueButton, valueLeft: 40, valueRight: 40) // Continue Button Layout
        
        addButton(button: skipButton, stackView: subMainStackTwo, buttonName: "Skip", titleColor: UIColor(hex: "40288E") ?? .black, backgroundColor: .clear, layerValue: 15, iconName: "", action: #selector(skipButtonTapped)) // Skip Button
    }
    
    
    private func fetchData (){
        if let fetchedData = DataManager.shared.fetchMotivationData() {
            for datas in fetchedData {
                nameTextField.text = datas.name
                
            }
        }
    }
    
    
    
    @objc func startButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty else {
               showAlert(title: "Error", message: "Please enter your name in the designated field.")
               return
           }
        let updateResult = DataManager.shared.createOrUpdateMotivationData(name: name)
        
        if updateResult {
            if navicationControl ==  "settings" {
                callHomeViewController()
            }else {
                let setupRepeatVC = EmotionsViewController()
                self.navigationController?.pushViewController(setupRepeatVC, animated: true)
            }
        } else {
            showAlert(title: "Error", message: "Data could not be saved.")
        }
    }
    
    @objc func skipButtonTapped () {
        if navicationControl ==  "settings" {
            callHomeViewController()
        }else {
            let setupRepeatVC = EmotionsViewController()
            self.navigationController?.pushViewController(setupRepeatVC, animated: true)
        }
        
    }
    
}
    
     

   
   

       
