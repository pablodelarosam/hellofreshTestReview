//
//  RecipeDetailViewController.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/12/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    
    //MARK: Outlets
    
    @IBOutlet weak var nameRecipe: UILabel!
    @IBOutlet weak var imageRecipe: ImageLoaderURL!
    
    //MARK: Properties
    var viewModel: ViewModelType!
    var recipe: Recipe!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRecipeDetail()
    }
    
    private func setUpRecipeDetail() {
        self.title = "Recipe Detail"
        nameRecipe?.text = recipe.name
        
        if let image = recipe.image {
            imageRecipe.loadImageUsingUrlString(image)
        }
    }
    
    @IBAction func saveFavorite(_ sender: UIButton) {
//        let recipe = viewModel.recipes[index]
//        viewModel.recipes[index].isLike = !recipe.isLike!
//        
//        if recipeViewModel.recipes[index].isLike! {
//            likeButton.setImage(UIImage(named: "heartfull"), for: .normal)
//
//        } else {
//            likeButton.setImage(UIImage(named: "heart"), for: .normal)
//
//        }
//        recipeViewModel.save()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
