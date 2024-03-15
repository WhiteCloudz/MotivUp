//
//  LikesViewController.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import UIKit
import CoreData

class LikesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    let backgroundView = UIView()
    let mainVStack = UIStackView()
    let tableView = UITableView()
    var backgroundImageNamed:String?
    
    var dataSource: [ Motivation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchData ()
        setupTableView()
        
    }
    
    
    private func setupUI(){
        view.addSubview(backgroundView)
        backgroundView.backgroundColor = .systemGray6
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        setupBackgroundViewLayout(backgroundView: backgroundView)
        
        addVerticalStack(stackName: mainVStack, spacing: 10, backgrounColor: .clear, layerValue: 0) // Main Stack
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(mainVStack)
        setupLayoutSquare(whereTo: view as Any, object: mainVStack, valueTop: 115, valueDown: 115, valueLeft: 5, valueRight: 5) // Main Stack Layout
        
        tableView.backgroundColor = .systemGray6
        tableView.translatesAutoresizingMaskIntoConstraints = false
        mainVStack.addArrangedSubview(tableView)
        
    }
    
    private func setupTableView(){
        tableView.register(LikedTableViewCell.self, forCellReuseIdentifier: "LikedTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    
    private func fetchData() {
        if let fetchedData = DataManager.shared.fetchLikeData() {
            for data in fetchedData {
                guard let likeSentences = data.likeSentences, let motivationID = data.motivationID else {
                    continue
                }

                let sentence = Motivation(motivationID: motivationID, motivationSentences: likeSentences)
                dataSource.append(sentence)
            }
        }
    }
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LikedTableViewCell", for: indexPath) as? LikedTableViewCell else {
            fatalError("MotivationTableViewCell is not defined")
        }

        let motivation = dataSource[indexPath.row]
        cell.configureCell(motivation) // configureCell(_:) fonksiyonunu çağırarak hücreyi yapılandır

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (action, view, completionHandler) in
            // Silme işlemini gerçekleştirme kodu
            self?.deleteAction(indexPath: indexPath)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash.fill")?.withRenderingMode(.alwaysOriginal)
        deleteAction.backgroundColor = .systemGray6
        
        let shareAction = UIContextualAction(style: .normal, title: nil) { [weak self] (action, view, completionHandler) in
            // Paylaşma işlemini gerçekleştirme kodu
            self?.shareAction(indexPath: indexPath)
            completionHandler(true)
        }
        shareAction.image = UIImage(named: "share")
        //shareAction.image?.withTintColor(.black)
        shareAction.backgroundColor = .systemGray6

        let configuration = UISwipeActionsConfiguration(actions: [shareAction, deleteAction])
        return configuration
    }
    
    func deleteAction(indexPath: IndexPath) {
        let likeToDelete = dataSource[indexPath.row]
        let motivationID = likeToDelete.motivationID

        let fetchRequestRoutine = NSFetchRequest<MotivUpData>(entityName: "MotivUpData")
        fetchRequestRoutine.predicate = NSPredicate(format: "dataID == %@", motivationID)

        let alert = UIAlertController(title: "Caution", message: "Are you sure you want to delete the sentence?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default) { _ in

            let deleteResult = DataManager.shared.deleteLikeData(motivationID: motivationID)
            if deleteResult {
                self.dataSource.remove(at: indexPath.row) 
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            } else {
        
            }

        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true, completion: nil)
    }

    
    
    func shareAction(indexPath: IndexPath) {
        let like = dataSource[indexPath.row]
        let textToShare = like.motivationSentences
        
        let NextVC = ShareViewController()
        NextVC.shareSentence = textToShare
        self.navigationController?.pushViewController(NextVC, animated: true)
    }
}
