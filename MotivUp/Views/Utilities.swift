//
//  Utilities.swift
//  MotivUp
//
//  Created by Fatih Akbulut on 3/6/24.
//

import UIKit
import Foundation


extension UIViewController {
    
    func setupBackroundImageToVievController(imageNamed: String, backgroundView:UIView ){
        if let backgroundImage = UIImage(named: imageNamed) {
            let imageView = UIImageView(image: backgroundImage)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            backgroundView.addSubview(imageView)
            backgroundView.sendSubviewToBack(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
//            imageView.layer.cornerRadius = imageView.bounds.height / 33
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
                
            ])
        }
    }
    
    func cornerRadius (component: AnyObject, value:Int) {
        component.layer.cornerRadius = component.bounds.height / CGFloat(value)
    }
    
    
    func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alert.dismiss(animated: true) {
                completion?()
            }
        }
    }
    
    func setupLayoutSquare(whereTo: Any, object: Any, valueTop: Int, valueDown: Int, valueLeft: Int, valueRight: Int){
          NSLayoutConstraint.activate([
              (object as AnyObject).topAnchor.constraint(equalTo: (whereTo as AnyObject).topAnchor, constant: CGFloat(valueTop)),
              (object as AnyObject).leadingAnchor.constraint(equalTo: (whereTo as AnyObject).leadingAnchor, constant: CGFloat(valueRight)),
              (object as AnyObject).trailingAnchor.constraint(equalTo: (whereTo as AnyObject).trailingAnchor, constant: -CGFloat(valueLeft)),
              (object as AnyObject).bottomAnchor.constraint(equalTo: (whereTo as AnyObject).bottomAnchor, constant: -CGFloat(valueDown))
          ])
      }
      
    func setupLayoutLeftAndRight(whereTo: Any, object: Any, valueLeft: Int, valueRight: Int){
          NSLayoutConstraint.activate([
             
              (object as AnyObject).leadingAnchor.constraint(equalTo: (whereTo as AnyObject).leadingAnchor, constant: CGFloat(valueRight)),
              (object as AnyObject).trailingAnchor.constraint(equalTo: (whereTo as AnyObject).trailingAnchor, constant: -CGFloat(valueLeft)),
             
          ])
      }
    
    
    public func setupBackgroundViewLayout (backgroundView: UIView){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    public func callHomeViewController(){
        let newRootViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: newRootViewController)
        navigationController.navigationBar.tintColor = .black

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = navigationController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
    
   
    @objc func nilFunc(){
        
    }
    
}



extension UIColor {
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        guard hexFormatted.count == 6 else { return nil }

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
