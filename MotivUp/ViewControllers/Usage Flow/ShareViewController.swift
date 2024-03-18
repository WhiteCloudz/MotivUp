//
//  ShareViewController.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/14/24.
//

import UIKit

class ShareViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let backgroundView = UIView()
    let mainVStack = UIStackView()
    let tableView = UITableView()
    
    var dataSource: [ImageName] = []
    var shareSentence: String = ""
    
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
        tableView.register(UINib(nibName: "ShareTableViewCell", bundle: nil), forCellReuseIdentifier: "ShareTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShareTableViewCell", for: indexPath) as? ShareTableViewCell else {
            fatalError("Hücre alınamadı")
        }

        let imageName = dataSource[indexPath.row].shareFrameName
        let shareSentence = dataSource[indexPath.row].shareSentence

        cell.configureCell(imageName, shareSentence: shareSentence)

        cell.buttonAction = { [weak self] in
            guard let self = self else { return }
            if let image = cell.shareImageView.image, let text = cell.shareSentenceLabel.text {
                let renderer = UIGraphicsImageRenderer(size: cell.bounds.size)
                let combinedImage = renderer.image { ctx in
                    let cellImageRect = CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height)
                    image.draw(in: cellImageRect)
                    
                    let maxSize = CGSize(width: cell.bounds.width - 80, height: cell.bounds.height - 90)
                    let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [
                        .font: UIFont(name: "Cochin", size: CGFloat(25)) ?? ""
                    ], context: nil).size
                    
                    let textX = (cell.bounds.width - textSize.width) / 2
                    let textY = (cell.bounds.height - textSize.height) / 2
                    
                    
                    let textRect = CGRect(x: textX, y: textY, width: textSize.width, height: textSize.height)
                    let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.alignment = .center

                    let attributes: [NSAttributedString.Key: Any] = [
                        .font: UIFont(name: "Cochin", size: self.setupMessageLabelFontSize(textLength: text.count)) ?? UIFont.systemFont(ofSize: 25),
                        .paragraphStyle: paragraphStyle,
                        .foregroundColor: UIColor.black
                    ]

                    let attributedText = NSAttributedString(string: text, attributes: attributes)
                    attributedText.draw(in: textRect)
                   
                    text.draw(in: textRect, withAttributes: attributes)
                }
                
                let activityViewController = UIActivityViewController(activityItems: [combinedImage], applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view
                self.present(activityViewController, animated: true, completion: nil)
            }
        }
        
        return cell
    }
    

    private func setupMessageLabelFontSize(textLength: Int) -> CGFloat {
        var fontSize: CGFloat = 0
        
        if textLength < 100 {
            fontSize = 25
        } else if textLength >= 100 && textLength < 150 {
            fontSize = 25
        } else if textLength >= 150 && textLength <= 200 {
            fontSize = 20
        } else {
            fontSize = 23
        }
        
        return fontSize
    }

    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    
    private func setupBackgroundName(){
        let background1 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame1", shareSentence: shareSentence)
        let background2 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame2", shareSentence: shareSentence)
        let background3 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame3", shareSentence: shareSentence)
        let background4 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame4", shareSentence: shareSentence)
        let background5 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame5", shareSentence: shareSentence)
        let background6 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame6", shareSentence: shareSentence)
        let background7 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame7", shareSentence: shareSentence)
        let background8 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame8", shareSentence: shareSentence)
        let background9 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame9", shareSentence: shareSentence)
        let background10 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame10", shareSentence: shareSentence)
        let background11 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame11", shareSentence: shareSentence)
        let background12 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame12", shareSentence: shareSentence)
        let background13 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame13", shareSentence: shareSentence)
        let background14 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame14", shareSentence: shareSentence)
        let background15 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame15", shareSentence: shareSentence)
        let background16 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame16", shareSentence: shareSentence)
        let background17 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame17", shareSentence: shareSentence)
        let background18 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame18", shareSentence: shareSentence)
        let background19 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame19", shareSentence: shareSentence)
        let background20 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame20", shareSentence: shareSentence)
        let background21 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame21", shareSentence: shareSentence)
        let background22 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame22", shareSentence: shareSentence)
        let background23 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame23", shareSentence: shareSentence)
        let background24 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame24", shareSentence: shareSentence)
        let background25 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame25", shareSentence: shareSentence)
        let background26 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame26", shareSentence: shareSentence)
        let background27 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame27", shareSentence: shareSentence)
        let background28 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame28", shareSentence: shareSentence)
        let background29 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame29", shareSentence: shareSentence)
        let background30 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame30", shareSentence: shareSentence)
        let background31 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame31", shareSentence: shareSentence)
        let background32 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame32", shareSentence: shareSentence)
        let background33 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame33", shareSentence: shareSentence)
        let background34 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame34", shareSentence: shareSentence)
        let background35 = ImageName(backgroundImageName: "", shareFrameName: "shareFrame35", shareSentence: shareSentence)
       

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
        dataSource.append(background30)
        dataSource.append(background31)
        dataSource.append(background32)
        dataSource.append(background33)
        dataSource.append(background34)
        dataSource.append(background35)
    }
    
}
