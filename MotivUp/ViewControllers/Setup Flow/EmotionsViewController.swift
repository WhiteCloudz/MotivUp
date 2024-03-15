//
//  EmotionsViewController.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import UIKit
import CoreData

class EmotionsViewController: UIViewController {
    
        var backgroundView = UIView()
        let mainVStack = UIStackView()
    
        let tapVStack = UIStackView()
        let image = UIImageView()
    
        let middileVStack = UIStackView()
        var messageTextView: UITextView = UITextView ()
        
        let bottomStack = UIStackView()
        let oneButtonStack = UIStackView()
        var lovingMyselfButton = UIButton ()
        var beingThankfulButton = UIButton ()
    
        let twoButtonStack = UIStackView()
        var loveButton = UIButton ()
        var happinessButton = UIButton ()
    
        let threeButtonStack = UIStackView()
        var personalGrowthButton = UIButton ()
        var positiveThinkingButton = UIButton ()
    
        var selectedControl:String = ""
        var navicationControl:String = ""
      

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData ()
        setupUI()
  
    }
    
    
    
        
    private func setupUI() {
        setupBackroundImageToVievController(imageNamed: "background", backgroundView: backgroundView)
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        setupBackgroundViewLayout(backgroundView: backgroundView)
        
        
        addVerticalStack(stackName: mainVStack, spacing: 40, backgrounColor: .clear, layerValue: 0)// Main Stack
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(mainVStack)
        setupLayoutSquare(whereTo: backgroundView, object: mainVStack, valueTop: 150, valueDown: 150, valueLeft: 20, valueRight: 20) // Main Stack Layout
        
        setupTapStack()
        setupButtomStack()
     
    }
    
    private func setupTapStack(){
        
        addVerticalStack(stackName: tapVStack, spacing: 5, backgrounColor: .clear, layerValue: 0) // Tap Stack View
        mainVStack.addArrangedSubview(tapVStack)
        addImageView(imageView: image, imageName: "chose", stackView: tapVStack) // Image
       
        addVerticalStack(stackName: middileVStack, spacing: 0, backgrounColor: .clear, layerValue: 0)
        mainVStack.addArrangedSubview(middileVStack)
        addUITextView(textView: messageTextView, stackView: middileVStack, fontSize: 33, textColor: UIColor(hex: "40288E") ?? .black, backgrounColor: .clear, message: """
        What areas of your life would you like to improve?
        """)  // Message Text View
        setupLayoutSquare(whereTo: middileVStack, object: messageTextView, valueTop: 25, valueDown: 5, valueLeft: 5, valueRight: 5) // TextView Layout
    }
    
    private func setupButtomStack(){
        
        addVerticalStack(stackName: bottomStack, spacing: 10, backgrounColor: .clear, layerValue: 0)  // Bottom Stack View
        mainVStack.addArrangedSubview(bottomStack)
        
        addHorizontalStack(stackName: oneButtonStack, spacing: 10)  // setup oneButtonStack
        bottomStack.addArrangedSubview(oneButtonStack)
        setupLayoutLeftAndRight(whereTo: middileVStack, object: oneButtonStack, valueLeft: 5, valueRight: 5)
        
        addButtonWithSelectColor(button: lovingMyselfButton, stackView: oneButtonStack, buttonName: "Loving myself", titleColor: UIColor(hex: "40288E") ?? .black, selectControl: selectedControl, backgroundColor: UIColor(hex: "D9DEFB") ?? .systemGray3, selectedBackgroundColur: UIColor(hex: "F6A704") ?? .systemGray3, layerValue: 15, iconName: "", action: #selector(handleCategoryButtonTapped))
        
        addButtonWithSelectColor(button: beingThankfulButton, stackView: oneButtonStack, buttonName: "Being thankful", titleColor: UIColor(hex: "40288E") ?? .black, selectControl: selectedControl, backgroundColor: UIColor(hex: "D9DEFB") ?? .systemGray3, selectedBackgroundColur: UIColor(hex: "F6A704") ?? .systemGray3, layerValue: 15, iconName: "", action: #selector(handleCategoryButtonTapped))
        
        
        addHorizontalStack(stackName: twoButtonStack, spacing: 10)
        bottomStack.addArrangedSubview(twoButtonStack)  // setup twoButtonStack
        setupLayoutLeftAndRight(whereTo: middileVStack, object: twoButtonStack, valueLeft: 5, valueRight: 5)
        
        addButtonWithSelectColor(button: loveButton, stackView: twoButtonStack, buttonName:  "Love", titleColor: UIColor(hex: "40288E") ?? .black, selectControl: selectedControl, backgroundColor: UIColor(hex: "D9DEFB") ?? .systemGray3, selectedBackgroundColur: UIColor(hex: "F6A704") ?? .systemGray3, layerValue: 15, iconName: "", action: #selector(handleCategoryButtonTapped))
        
        addButtonWithSelectColor(button: happinessButton, stackView: twoButtonStack, buttonName:   "Happiness", titleColor: UIColor(hex: "40288E") ?? .black, selectControl: selectedControl, backgroundColor: UIColor(hex: "D9DEFB") ?? .systemGray3, selectedBackgroundColur: UIColor(hex: "F6A704") ?? .systemGray3, layerValue: 15, iconName: "", action: #selector(handleCategoryButtonTapped))
     
        
        addHorizontalStack(stackName: threeButtonStack, spacing: 10)
        bottomStack.addArrangedSubview(threeButtonStack)  // setup threeButtonStack
        setupLayoutLeftAndRight(whereTo: middileVStack, object: threeButtonStack, valueLeft: 5, valueRight: 5)
        
        addButtonWithSelectColor(button: personalGrowthButton, stackView: threeButtonStack, buttonName: "Positive thinking", titleColor: UIColor(hex: "40288E") ?? .black, selectControl: selectedControl, backgroundColor: UIColor(hex: "D9DEFB") ?? .systemGray3, selectedBackgroundColur: UIColor(hex: "F6A704") ?? .systemGray3, layerValue: 15, iconName: "", action: #selector(handleCategoryButtonTapped))
        
        addButtonWithSelectColor(button: positiveThinkingButton, stackView: threeButtonStack, buttonName: "Personal Growth", titleColor: UIColor(hex: "40288E") ?? .black, selectControl: selectedControl, backgroundColor: UIColor(hex: "D9DEFB") ?? .systemGray3, selectedBackgroundColur: UIColor(hex: "F6A704") ?? .systemGray3, layerValue: 15, iconName: "", action: #selector(handleCategoryButtonTapped))
    }
    
    
    private func fetchData (){
        if let fetchedData = DataManager.shared.fetchMotivationData() {
            for data in fetchedData {
                let categoryName = data.category
                selectedControl = categoryName ?? ""
            }
        }
    }
   
    
    
    @objc func handleCategoryButtonTapped(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        
        let updateResult = DataManager.shared.createOrUpdateMotivationData(category: text)
        
        if updateResult {
            UserDefaults.standard.removeObject(forKey: "lastSentence")
            UserDefaults.standard.removeObject(forKey: "lastDate")
            callHomeViewController()
        } else {
            showAlert(title: "Error", message: "Data could not be saved.")
        }
    }


}
   
 
