//
//  SettingsViewController.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//


import UIKit
import CoreData

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   
    let backgroundView = UIView()
    let mainVStack = UIStackView()
    let tableView = UITableView()
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
    }
    
  
    private func setupUI(){
        view.addSubview(backgroundView)
        backgroundView.backgroundColor = .systemGray5
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        setupBackgroundViewLayout(backgroundView: backgroundView)
        
        addVerticalStack(stackName: mainVStack, spacing: 10, backgrounColor: .systemGray5, layerValue: 0) // Main Stack
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(mainVStack)
        setupLayoutSquare(whereTo: view as Any, object: mainVStack, valueTop: 40, valueDown: 40, valueLeft: 15, valueRight: 14) // Main Stack Layout
        
        tableView.backgroundColor = .systemGray5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        mainVStack.addArrangedSubview(tableView)
        
    }
    
    private func setupTableView(){
        tableView.register(UpdateTableViewCell.self, forCellReuseIdentifier: "UpdateTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UpdateTableViewCell", for: indexPath) as? UpdateTableViewCell else {
            fatalError("Unable to dequeue cell")
        }
        

        
        cell.nameButtonAction = { [weak self] in
            
            let NextVC = SetupNameViewController()
            NextVC.navicationControl = "settings"
            self?.navigationController?.pushViewController(NextVC, animated: true)
        }
        
        cell.emotionButtonAction = { [weak self] in
            
            let NextVC = EmotionsViewController()
            NextVC.navicationControl = "settings"
            self?.navigationController?.pushViewController(NextVC, animated: true)
        }
        
        cell.backgroundButtonAction = { [weak self] in
            
            let NextVC = BackgroundChangeViewController()
            self?.navigationController?.pushViewController(NextVC, animated: true)
        }
        
        
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
 
   
}
