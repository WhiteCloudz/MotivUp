//
//  HomeViewController.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    
    var backgroundView = UIView()
    let mainVStack = UIStackView()
    
    let tapVStack = UIStackView()
    
    let middileVStack = UIStackView()
    var messageLabel: UILabel = UILabel()
    var emotionsCategory:String = ""
    var motivationID:String = ""
    var motivationSentences:String = ""
    var likeControl:String = ""
    
    let bottomVStack = UIStackView()
    let hStack = UIStackView()
    let settingStack = UIStackView()
    
    var shareButton = UIButton ()
    var settingsButton = UIButton ()
    var likeButton = UIButton()
    var refreshButton = UIButton()
    var image = UIImageView()
    
    var backgroundImageNamed:String?
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData ()
        fetchLikeData ()
        setupUI()
        updateMessageLabel()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    
    
    private func fetchData (){
        if let fetchedData = DataManager.shared.fetchMotivationData() {
            for data in fetchedData {
                backgroundImageNamed = data.backgroundImageName
                guard let category = data.category else {return}
                emotionsCategory = category
                
            }
        }
    }
    
    
    private func fetchLikeData (){
        if let fetchedData = DataManager.shared.fetchLikeData() {
            for data in fetchedData {
                guard let likeSentence = data.likeSentences else {return}
               likeControl = likeSentence
                
            }
        }
    }
    
    
    
    private func setupUI() {
        setupBackroundImageToVievController(imageNamed: backgroundImageNamed ?? "homeBackground7", backgroundView: backgroundView)
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        setupBackgroundViewLayout(backgroundView: backgroundView)
        
        addVerticalStack(stackName: mainVStack, spacing: 20, backgrounColor: .clear, layerValue: 0)// Main Stack
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(mainVStack)
        setupLayoutSquare(whereTo: backgroundView, object: mainVStack, valueTop: 0, valueDown: 70, valueLeft: 25, valueRight: 25) // Main Stack Layout
        
        addVerticalStack(stackName: tapVStack, spacing: 0, backgrounColor: .clear, layerValue: 0)
        mainVStack.addArrangedSubview(tapVStack)
        
        addVerticalStack(stackName: middileVStack, spacing: 0, backgrounColor: .clear, layerValue: 0)
        mainVStack.addArrangedSubview(middileVStack)
        
        addUILabel(label: messageLabel, stackView: middileVStack, text: motivationSentences, fontSize: 33, textColor: UIColor(hex: "201B4D") ?? .black, textAlignment: .center, backgrounColor: .clear)
        setupMessageLabelFontSize()
  
        setupBottomStack()
        
    }
    
    
    private func setupBottomStack(){
        
        addVerticalStack(stackName: bottomVStack, spacing: 30, backgrounColor: .clear, layerValue: 0)
        mainVStack.addArrangedSubview(bottomVStack)
        
        addNilLabel(stackView: bottomVStack)
        
        addHorizontalStack(stackName: hStack, spacing: 15)
        bottomVStack.addArrangedSubview(hStack)
        setupLayoutLeftAndRight(whereTo: mainVStack, object: hStack, valueLeft: 65, valueRight: 65)
        
        addButton(button: settingsButton, stackView: hStack, buttonName: "", titleColor: UIColor(hex: "201B4D") ?? .black, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 15, iconName: "gearshape", action: #selector(settingsButtonTapped))
        hStack.addArrangedSubview(settingsButton)
        
        
        addButton(button: likeButton, stackView: hStack, buttonName: "", titleColor: UIColor(hex: "201B4D") ?? .black, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 15, iconName: "heart", action: #selector(likeButtonTapped))
        hStack.addArrangedSubview(likeButton)
        
        setupLikeButtonColor()
        
        
        addButton(button: shareButton, stackView: hStack, buttonName: "", titleColor: UIColor(hex: "201B4D") ?? .black, backgroundColor: UIColor.systemBrown.withAlphaComponent(0.1), layerValue: 15, iconName: "square.and.arrow.up", action: #selector(shareButtonTapped))
        hStack.addArrangedSubview(shareButton)
        
        addNilLabel(stackView: bottomVStack)

        
    }
    
    private func setupMessageLabelFontSize() {
        let text = motivationSentences
        let length = text.count
        var fontSize: CGFloat = 0
        
        if length < 100 {
            fontSize = 28
        } else if length >= 100 && length < 150 {
            fontSize = 25
        } else if length >= 150 && length <= 200 {
            fontSize = 23
        } else {
            fontSize = 23
        }
        messageLabel.font = UIFont(name: "Cochin", size: fontSize)
        
    }
    
    
    
    @objc func settingsButtonTapped() {
        let NameVC = SettingsViewController()
        self.navigationController?.pushViewController(NameVC, animated: true)
       
    }
    
    @objc func likeButtonTapped() {
      
          var containsSpecificSentence = false
      
          if let fetchedData = DataManager.shared.fetchLikeData() {
              for controlValue in fetchedData {
                  if controlValue.likeSentences ==  motivationSentences {
                      containsSpecificSentence = true
                      break
                  }
              }
          }

          if containsSpecificSentence == true {
              let deleteResult = DataManager.shared.deleteLikeData(motivationID: motivationID)
              if deleteResult {
                  likeButton.backgroundColor = UIColor.systemBrown.withAlphaComponent(0.1)
                  likeButton.tintColor = UIColor(hex: "201B4D") ?? .black
                  print("\(motivationSentences) SILINDII")
              } else {
                  print("Data deletion failed.")
                  showAlert(title: "Error", message: "Data could not be deleted.")
              }
          } else {
              let saveResult = DataManager.shared.createOrUpdateLikeData(motivationID: motivationID, likeSentences: motivationSentences)
              if saveResult {
              
                  likeButton.backgroundColor = .red
                  likeButton.tintColor = .white
                  print("\(motivationSentences) EKLENDI")
              } else {
                  print("Data saving failed.")
                  showAlert(title: "Error", message: "Data could not be saved.")
              }
          }
      }
    
    
    private func setupLikeButtonColor(){
        if motivationSentences == likeControl {
            likeButton.backgroundColor = UIColor.systemBrown.withAlphaComponent(0.1)
            likeButton.tintColor = UIColor(hex: "201B4D") ?? .black
        }else{
            likeButton.backgroundColor = .red
            likeButton.tintColor = .white
        }
    }
       
    
    @objc func shareButtonTapped(_ sender: Any){
        
        let NextVC = ShareViewController()
        NextVC.shareSentence = motivationSentences
        self.navigationController?.pushViewController(NextVC, animated: true)

    }
    
    
    
    private func updateMessageLabel() {
        let currentDate = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        if hour == 7 {
            if let randomSentence = getRandomMotivationSentence() {
                messageLabel.text = randomSentence
                motivationSentences = randomSentence
            } else {
                messageLabel.text = "No motivation available."
            }
        } else {
            if let lastDate = UserDefaults.standard.object(forKey: "lastDate") as? Date {
                if calendar.isDateInToday(lastDate) {
                    if let lastSentence = UserDefaults.standard.string(forKey: "lastSentence") {
                        messageLabel.text = lastSentence
                        motivationSentences = lastSentence
                    } else {
                        messageLabel.text = "No motivation available."
                    }
                } else {
                    if let randomSentence = getRandomMotivationSentence() {
                        messageLabel.text = randomSentence
                        motivationSentences = randomSentence
                        UserDefaults.standard.set(currentDate, forKey: "lastDate")
                        UserDefaults.standard.set(randomSentence, forKey: "lastSentence")
                    } else {
                        messageLabel.text = "No motivation available."
                    }
                }
            } else {
                if let randomSentence = getRandomMotivationSentence() {
                    messageLabel.text = randomSentence
                    motivationSentences = randomSentence
                    UserDefaults.standard.set(currentDate, forKey: "lastDate")
                    UserDefaults.standard.set(randomSentence, forKey: "lastSentence")
                } else {
                    messageLabel.text = "No motivation available."
                }
            }
        }
    }
    
    
    func getRandomMotivationSentence() -> String? {
        switch emotionsCategory {
        case "Loving myself":
            return getRandomSentenceFromList(selfLoveList)
        case "Being thankful":
            return getRandomSentenceFromList(beingThankfulList)
        case "Love":
            return getRandomSentenceFromList(loveList)
        case "Happiness":
            return getRandomSentenceFromList(happinessList)
        case "Positive thinking":
            return getRandomSentenceFromList(positifThikingList)
        case "Personal Growth":
            return getRandomSentenceFromList(growthList)
        default:
            return getRandomSentenceFromList(loveList)
        }
    }
    
    func getRandomSentenceFromList(_ list: [Motivation]) -> String? {
        guard !list.isEmpty else { return nil }
        var randomIndex: Int

        repeat {
            randomIndex = Int.random(in: 0..<list.count)
            motivationID = list[randomIndex].motivationID
            motivationSentences = list[randomIndex].motivationSentences
        } while DataManager.shared.isMotivationIDRegistered(motivationID: motivationID)
        
        _ = DataManager.shared.createOrUpdateLikeData(motivationID: list[randomIndex].motivationID)
        return list[randomIndex].motivationSentences
    }
}
