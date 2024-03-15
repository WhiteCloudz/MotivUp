//
//  ViewController.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var userID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
       
    }
    
    func setupUI() {
        let coreDataManager = DataManager.shared
        let context = coreDataManager.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<MotivUpData> = MotivUpData.fetchRequest()
        
        do {
            let results = try context.fetch(fetchRequest)
            for result in results {
                userID =  result.userIDs ?? ""
            }
            let rootVC: UIViewController
            if userID.isEmpty {
                rootVC = FirstViewController()
            } else {
                rootVC = HomeViewController()
            }
            
            let navigationController = UINavigationController(rootViewController: rootVC)
            navigationController.navigationBar.tintColor = UIColor(hex: "201B4D") ?? .black
            navigationController.navigationBar.barTintColor = .systemGray5
            
            addChild(navigationController)
            view.addSubview(navigationController.view)
            navigationController.didMove(toParent: self)
            
        } catch {
            print("Fetch failed: \(error)")
        }
    }
}


