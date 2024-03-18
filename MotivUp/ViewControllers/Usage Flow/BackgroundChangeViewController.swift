//
//  BackgroundChangeViewController.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import Foundation
import UIKit
import CoreData

class BackgroundChangeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let backgroundView = UIView()
    let mainVStack = UIStackView()
    let tableView = UITableView()
    
    var dataSource: [ ImageName] = []
    var exampleSentence:String = "The only way to do great work is to love what you do."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundName()
        setupUI()
        setupTableView()
    }
    
    
    private func setupUI(){
        view.addSubview(backgroundView)
        backgroundView.backgroundColor = .systemGray5
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        setupBackgroundViewLayout(backgroundView: backgroundView)
        
        addVerticalStack(stackName: mainVStack, spacing: 10, backgrounColor: .clear, layerValue: 0) // Main Stack
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(mainVStack)
        setupLayoutSquare(whereTo: view as Any, object: mainVStack, valueTop: 110, valueDown: 45, valueLeft: 25, valueRight: 25) // Main Stack Layout
        
        tableView.backgroundColor = .systemGray5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        mainVStack.addArrangedSubview(tableView)
        
    }
    
    private func setupTableView(){
        tableView.register(BackgroundTableViewCell.self, forCellReuseIdentifier: "BackgroundTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BackgroundTableViewCell", for: indexPath) as? BackgroundTableViewCell else {
            fatalError("Unable to dequeue cell")
        }

        let imageName = dataSource[indexPath.row].backgroundImageName
        let shareSentence = exampleSentence
        
        cell.configureCell(imageName, motivationSentence: shareSentence)
        
        cell.buttonAction = { [weak self] in
            
            let updateResult = DataManager.shared.createOrUpdateMotivationData(backgroundImageName: imageName)
            if updateResult {
                self?.callHomeViewController()
                
            } else {
                self?.showAlert(title: "Error", message: "Data could not be saved.")
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
    private func setupBackgroundName(){
        let background1 = ImageName(backgroundImageName: "homeBackground1", shareFrameName: "", shareSentence: "")
        let background2 = ImageName(backgroundImageName: "homeBackground2", shareFrameName: "", shareSentence: "")
        let background3 = ImageName(backgroundImageName: "homeBackground3", shareFrameName: "", shareSentence: "")
        let background4 = ImageName(backgroundImageName: "homeBackground4", shareFrameName: "", shareSentence: "")
        let background5 = ImageName(backgroundImageName: "homeBackground5", shareFrameName: "", shareSentence: "")
        let background6 = ImageName(backgroundImageName: "homeBackground6", shareFrameName: "", shareSentence: "")
        let background7 = ImageName(backgroundImageName: "homeBackground7", shareFrameName: "", shareSentence: "")
        let background8 = ImageName(backgroundImageName: "homeBackground8", shareFrameName: "", shareSentence: "")
        let background9 = ImageName(backgroundImageName: "homeBackground9", shareFrameName: "", shareSentence: "")
        let background10 = ImageName(backgroundImageName: "homeBackground10", shareFrameName: "", shareSentence: "")
        let background11 = ImageName(backgroundImageName: "homeBackground11", shareFrameName: "", shareSentence: "")
        let background12 = ImageName(backgroundImageName: "homeBackground12", shareFrameName: "", shareSentence: "")
        let background13 = ImageName(backgroundImageName: "homeBackground13", shareFrameName: "", shareSentence: "")
        let background14 = ImageName(backgroundImageName: "homeBackground14", shareFrameName: "", shareSentence: "")
        let background15 = ImageName(backgroundImageName: "homeBackground15", shareFrameName: "", shareSentence: "")
        let background16 = ImageName(backgroundImageName: "homeBackground16", shareFrameName: "", shareSentence: "")
        let background17 = ImageName(backgroundImageName: "homeBackground17", shareFrameName: "", shareSentence: "")
        let background18 = ImageName(backgroundImageName: "homeBackground18", shareFrameName: "", shareSentence: "")
        let background19 = ImageName(backgroundImageName: "homeBackground19", shareFrameName: "", shareSentence: "")
        let background20 = ImageName(backgroundImageName: "homeBackground20", shareFrameName: "", shareSentence: "")
        let background21 = ImageName(backgroundImageName: "homeBackground21", shareFrameName: "", shareSentence: "")
        let background22 = ImageName(backgroundImageName: "homeBackground22", shareFrameName: "", shareSentence: "")
        let background23 = ImageName(backgroundImageName: "homeBackground23", shareFrameName: "", shareSentence: "")
        let background24 = ImageName(backgroundImageName: "homeBackground24", shareFrameName: "", shareSentence: "")
        let background25 = ImageName(backgroundImageName: "homeBackground25", shareFrameName: "", shareSentence: "")
        let background26 = ImageName(backgroundImageName: "homeBackground26", shareFrameName: "", shareSentence: "")
        let background27 = ImageName(backgroundImageName: "homeBackground27", shareFrameName: "", shareSentence: "")
        let background28 = ImageName(backgroundImageName: "homeBackground28", shareFrameName: "", shareSentence: "")
        let background29 = ImageName(backgroundImageName: "homeBackground29", shareFrameName: "", shareSentence: "")
        
        
        dataSource.append(background1)
        dataSource.append(background2)
        dataSource.append(background3)
        dataSource.append(background4)
        dataSource.append(background5)
        dataSource.append(background6)
        dataSource.append(background7)
        dataSource.append(background8)
        dataSource.append(background9)
        dataSource.append(background10)
        dataSource.append(background11)
        dataSource.append(background12)
        dataSource.append(background13)
        dataSource.append(background14)
        dataSource.append(background15)
        dataSource.append(background16)
        dataSource.append(background17)
        dataSource.append(background18)
        dataSource.append(background19)
        dataSource.append(background20)
        dataSource.append(background21)
        dataSource.append(background22)
        dataSource.append(background23)
        dataSource.append(background24)
        dataSource.append(background25)
        dataSource.append(background26)
        dataSource.append(background27)
        dataSource.append(background28)
        dataSource.append(background29)
    }

    
}
