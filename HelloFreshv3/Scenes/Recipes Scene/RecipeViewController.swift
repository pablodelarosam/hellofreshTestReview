//
//  RecipeViewController.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/9/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

typealias ViewModelType = RecipeViewModel

class RecipeViewController: UIViewController {
    
    weak var coordinator: RecipeCoordinator?
 //   typealias ViewModelType = RecipeViewModel
    
    // MARK: - Properties
    var viewModel: ViewModelType!
    private let disposeBag = DisposeBag()
    public var recipes = PublishSubject<[Recipe]>()
    private let identifier = "Cell"
    
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

         setupBindings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    // MARK: - Bindings
     
     private func setupBindings() {
        tableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
        recipes.bind(to: tableView.rx.items(cellIdentifier: identifier, cellType: RecipeTableViewCell.self)) {  (row,recipe,cell) in
            cell.nameRecipe?.text =  recipe.name
    
            }.disposed(by: disposeBag)
        
        viewModel
            .recipes
            .observeOn(MainScheduler.instance)
           .bind(to: self.recipes)
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(Recipe.self)
            .subscribe(onNext: { recipe  in
                self.coordinator?.goToDetailRecipe(recipe: recipe)
//                let recipesDetailController = RecipesDetailViewController()
//                recipesDetailController.recipe = model
//                self.navigationController?.pushViewController(recipesDetailController, animated: true)
            })
            .disposed(by: disposeBag)
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


