//
//  RecipeCoordinator.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/9/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import Foundation
import UIKit

class RecipeCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators = [Coordinator]()
    
    lazy var recipeViewModel: RecipeViewModel! = {
         let recipeService = RecipeService()
        let viewModel = RecipeViewModel(recipeService)
        return viewModel
    }()
    
    var navigationController = UINavigationController()
    
    func start() {
        let recipe =  RecipeViewController.instantiate(fromAppStoryboard: .Recipe)
        recipe.coordinator = self
        recipe.viewModel = recipeViewModel
        recipe.title = "Recipe Controller"
        navigationController.pushViewController(recipe, animated: true)
    }
    
    // MARK: - Coordinator
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension RecipeCoordinator {
    func goToDetailRecipe(recipe: Recipe) {
        let detailRecipeviewController = RecipeDetailViewController.instantiate(fromAppStoryboard: .Recipe)
        detailRecipeviewController.recipe = recipe
        detailRecipeviewController.viewModel = recipeViewModel
        navigationController.pushViewController(detailRecipeviewController, animated: true)
    }
}
