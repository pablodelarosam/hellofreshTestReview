//
//  AppCoordinator.swift
//  HelloFreshv2
//
//  Created by Pablo de la Rosa Michicol on 9/25/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator:  NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    
    lazy var loginViewModel: LoginControllerViewModel! = {
         let loginService = LoginService()
        let viewModel = LoginControllerViewModel(loginService)
     //   viewModel.coordinator = self
        return viewModel
    }()
    
    func start() {
          navigationController.delegate = self
          let signin = LoginViewController.instantiate(fromAppStoryboard: .Login)

          signin.coordinator = self

          signin.viewModel = loginViewModel
          navigationController.pushViewController(signin, animated: true)

    }
    
    
    func childDidFinish(_ child: Coordinator?) {
        for(index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let signinController = fromViewController as? LoginViewController {
            childDidFinish(signinController.coordinator)
        }
        
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}


// MARK: - Navigation
extension AppCoordinator {

    
    //Navigating in the same scene
    func goToLocationSearch( from controller: UIViewController) {
  /*   let speciesListScene = SpeciesDetailViewController.instantiate(fromAppStoryboard: .SpeciesDetail)
//        viewController.viewModel = locationSearchViewModel
        speciesListScene.title = "Species detail controller"
           navigationController.pushViewController(speciesListScene, animated: true)
//        controller.present(speciesListScene, animated: true, completion: nil)*/
    }
    
    
    //Navigating to a different scene implies, instantiate the new coordinator of the scene

    func goToRecipesList(from controller: UIViewController) {
        let signinCoordinator = RecipeCoordinator(navigationController: navigationController)
        signinCoordinator.parentCoordinator = self
        childCoordinators.append(signinCoordinator)
//        let searchCoordinator = SearchCoordinator(rootViewController: rootNavigationController, apiClient: apiClient, searchInput: validatedState)
//        detailCoordinator.delegate = self
//        addChildCoordinator(searchCoordinator)
        signinCoordinator.start()
    }
    
}
 

