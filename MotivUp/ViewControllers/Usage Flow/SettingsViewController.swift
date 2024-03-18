//
//  SettingsViewController.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController {
   
    let backgroundView = UIView()
    let mainVStack = UIStackView()

    let helpLabel = UILabel()
    let subTapStackHelp = UIStackView()
    var helpButton = UIButton()
    let subTapStackContact = UIStackView()
    let contactUsButton = UIButton()
    
    let settingsLabel = UILabel()
    let subTapStackOne = UIStackView()
    var changeNameButton = UIButton()
    
    let subTapStackTwo = UIStackView()
    var choseEmotionsButton = UIButton()
    
    let subTapStackThree = UIStackView()
    var setReminderButton = UIButton()
    
    let nilButton = UIButton()
    
    let subTapStackLike = UIStackView()
    let likesLabel = UILabel()
    var likeButton = UIButton()
    
    let subLikeStackReset = UIStackView()
    let resetLabel = UILabel()
    let resetButton = UIButton()
    
    let subLikeStackBackground = UIStackView()
    let backgroundButton = UIButton()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
  
    private func setupUI(){
        setupBackroundImageToVievController(imageNamed: "background", backgroundView: backgroundView)
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        setupBackgroundViewLayout(backgroundView: backgroundView)
  
        addVerticalStack(stackName: mainVStack, spacing: 10, backgrounColor: .clear, layerValue: 0) // Main Stack View
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(mainVStack)
        setupLayoutSquare(whereTo: view as Any, object: mainVStack, valueTop: 80, valueDown: 160, valueLeft: 25, valueRight: 25) // Main Stack Layout

        setupSettingsStack()
        setupHelpStack()
        
    }
    
    private func setupSettingsStack(){
        
        
        addButtonWithIcone(button: nilButton, stackView: mainVStack, buttonName: "", titleColor: .clear, backgroundColor: .clear, layerValue: 8, iconName: "", action: #selector(nilFunc))
        
        addUILabel(label: settingsLabel, stackView: mainVStack, text: "Settings", fontSize: 35, textColor: UIColor(hex: "201B4D") ?? .black,textAlignment: .left , backgrounColor: .clear) // Setup Settings Label
        
        addVerticalStack(stackName: subTapStackOne, spacing: 0, backgrounColor: .clear, layerValue: 25)
        mainVStack.addArrangedSubview(subTapStackOne)
        addButtonWithIcone(button: changeNameButton, stackView: subTapStackOne, buttonName: "Edit Name", titleColor: UIColor(hex: "201B4D") ?? .black, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 8, iconName: "pencil", action: #selector(goToEditName))
       
        addVerticalStack(stackName: subTapStackTwo, spacing: 0, backgrounColor: .clear, layerValue: 3)
        mainVStack.addArrangedSubview(subTapStackTwo)
        addButtonWithIcone(button: choseEmotionsButton, stackView: subTapStackTwo, buttonName: "Edit Chose Emotion", titleColor: UIColor(hex: "201B4D") ?? .black, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 8, iconName: "checkmark.circle", action: #selector(goToEditEmotion))
    
        
        addVerticalStack(stackName: subLikeStackBackground, spacing: 0, backgrounColor: .clear, layerValue: 13)
        mainVStack.addArrangedSubview(subLikeStackBackground)
        addButtonWithIcone(button: backgroundButton, stackView: subLikeStackBackground, buttonName: "Change Background", titleColor: UIColor(hex: "201B4D") ?? .black, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 8, iconName: "photo.on.rectangle.angled", action: #selector(goToBackgroundChangeViewController))
        
    }
    
    
    private func setupHelpStack(){
   
        
        addNilLabel(stackView: mainVStack)
        
        addUILabel(label: likesLabel, stackView: mainVStack, text: "Likes", fontSize: 35, textColor: UIColor(hex: "201B4D") ?? .black, textAlignment: .left , backgrounColor: .clear) // Setup Help Label
    
        addVerticalStack(stackName: subTapStackLike, spacing: 0, backgrounColor: .clear, layerValue: 13)
        mainVStack.addArrangedSubview(subTapStackLike)
        addButtonWithIcone(button: likeButton, stackView: subTapStackLike, buttonName: "Likes", titleColor: UIColor(hex: "201B4D") ?? .black, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 8, iconName: "heart", action: #selector(goToLikesViewController))
        
        addNilLabel(stackView: mainVStack)
        
        addUILabel(label: helpLabel, stackView: mainVStack, text: "Help", fontSize: 35, textColor: UIColor(hex: "201B4D") ?? .black,textAlignment: .left , backgrounColor: .clear) // Setup Help Label
        
        
        addVerticalStack(stackName: subTapStackContact, spacing: 0, backgrounColor: .clear, layerValue: 13)
        mainVStack.addArrangedSubview(subTapStackContact)
        addButtonWithIcone(button: contactUsButton, stackView: subTapStackContact, buttonName: "Contact Us", titleColor: UIColor(hex: "201B4D") ?? .black, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 8, iconName: "phone.bubble", action: #selector(goToContactUsForm))
        
        
        addVerticalStack(stackName: subLikeStackReset, spacing: 0, backgrounColor: .clear, layerValue: 13)
        mainVStack.addArrangedSubview(subLikeStackReset)
        addButtonWithIcone(button: resetButton, stackView: subLikeStackReset, buttonName: "Reset", titleColor: .systemRed, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 8, iconName: "trash", action: #selector(setupResetButton))
        
    
    }
    
    
   
    
    @objc func goToEditName(){
        let NextVC = SetupNameViewController()
        NextVC.navicationControl = "settings"
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    @objc func goToEditEmotion(){
        let NextVC = EmotionsViewController()
        NextVC.navicationControl = "settings"
        self.navigationController?.pushViewController(NextVC, animated: true)
    }

    
    @objc func goToContactUsForm() {
        if let url = URL(string: "https://forms.gle/HDgeCjYwusC5ygTv8") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func goToLikesViewController(){
        let NextVC = LikesViewController()
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    
    @objc func goToBackgroundChangeViewController(){
        let NextVC = BackgroundChangeViewController()
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
    
    
    
    @objc func setupResetButton(){
       
        let alert = UIAlertController(title: "Coution", message: "When you click the Reset button, all your saved data will be irreversibly erased.", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Reset", style: .default) { (action) in
         
            let updateResult = DataManager.shared.deleteMotivationData(forUserID: "userOfMotivUp")
            if updateResult {
                DataManager.shared.deleteLikedAllData()
                UserDefaults.standard.removeObject(forKey: "lastSentence")
                UserDefaults.standard.removeObject(forKey: "lastDate")
                self.startApp()
            }
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        resetAction.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(resetAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    private func startApp(){
        let newRootViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: newRootViewController)
        navigationController.navigationBar.tintColor = .black

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = navigationController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
   
}

