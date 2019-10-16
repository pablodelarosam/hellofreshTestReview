//
//  UIViewControllerExtensions.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/15/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func presentError(_ error: NSError) {
        let alertController = UIAlertController(title: "Error",
                                                message: error.domain,
                                                preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default))
        self.present(alertController, animated: true)
    }
    func presentMessage(_ message: String) {
        let alertController = UIAlertController(title: "Message",
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default))
        self.present(alertController, animated: true)
    }
}
