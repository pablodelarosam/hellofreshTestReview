//
//  ControllerType.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/7/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import Foundation

import UIKit

protocol ControllerType: class {
    associatedtype ViewModelType: ViewModelProtocol
    /// Configurates controller with specified ViewModelProtocol subclass
    ///
    /// - Parameter viewModel: CPViewModel subclass instance to configure with
    func configure(with viewModel: ViewModelType)
    /// Factory function for view controller instatiation
    ///
    /// - Parameter viewModel: View model object
    /// - Returns: View controller of concrete type
    static func create(with viewModel: ViewModelType) -> UIViewController
}
