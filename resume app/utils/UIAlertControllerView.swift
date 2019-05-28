//
//  UIAlertControllerView.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

// MARK: - UIAlertControllerView class
class UIAlertControllerView {
    
    // MARK: - Attributes
    typealias completion = (() -> Void)
    
    
    // MARK: - Main functions
    /**
     Presents a simple alert controller with a message and a simple button action.
     
     - Parameter view: The view where alert controller is presented.
     - Parameter title: Title for the alert controller
     - Parameter message: Message for the alert controller
     */
    static func showAlert(from view: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(buttonAction)
        view.present(alertController, animated: true, completion: nil)
    }
    
    /**
     Presents an alert controller with an activity indicator to indicate a loading task is in progress.
     
     - Parameter view: The view where alert controller is presented.
     - Parameter message: Message for the alert controller
     */
    static func showLoading(from view: UIViewController, message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        view.present(alert, animated: true, completion: nil)
    }
    
    /**
     Hides current loading alert controller that is already presented.
     
     - Parameter view: The view where alert controller is presented.
     - Parameter completion: closure for completion task
     */
    static func hideLoading(from view: UIViewController, completion: completion? = nil) {
        view.dismiss(animated: false, completion: completion)
    }
}
