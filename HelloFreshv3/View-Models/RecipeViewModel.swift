//
//  RecipeViewModel.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/11/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import Foundation
import RxSwift

class RecipeViewModel {
    
    struct Input {
        let favoriteDidTap: AnyObserver<Void>
    }
    struct Output {
        let favoriteResultObservable: Observable<User>
        let errorsObservable: Observable<Error>
    }
    
    let disposeBag = DisposeBag()
    public let recipes : BehaviorSubject<[Recipe]> = BehaviorSubject(value: [Recipe]())
    private let favoriteDidTapSubject = PublishSubject<Void>()
    private let favoriteResultSubject = PublishSubject<User>()
    private let errorsSubject = PublishSubject<Error>()
    private let recipeService: RecipeService
    

    
    // MARK: - Public properties
    let input: Input
    let output: Output

    // MARK: - Init and deinit
    init(_ recipeService: RecipeServiceProtocol) {
    
//        self.recipeService = recipeService
        recipes.subscribe(onNext: { recipes in
            print("First Subscription: ", recipes)
        
        }).disposed(by: disposeBag)
        recipeService.requestRecipes("") { (result) in
            switch result {
            case .success(let recipes):
                self.recipes.onNext(recipes)
                print(recipes)
            case .failure(let error):
                print(error)
            }
        }
        input = Input(
                      favoriteDidTap: favoriteDidTapSubject.asObserver())
        
        output = Output(favoriteResultObservable: favoriteResultSubject.asObservable(),
                        errorsObservable: errorsSubject.asObservable())
        
//        favoriteDidTapSubject
//            .subscribe(onNext: { [weak self] event in
//                switch event {
//                case .next(let user):
//                    self?.loginResultSubject.onNext(user)
//                case .error(let error):
//                    self?.errorsSubject.onNext(error)
//                default:
//                    break
//                }
//            })
//            .disposed(by: disposeBag)
    }

    
    deinit {
        print("\(self) dealloc")
    }
    
    public func saveRecipe() {
        recipeService
    }
    
    public func getRecipes() {
        
    }
    
//    init(dataManager: DataManager) {
//        self.dataManager = dataManager
//    }
//    
//    func fetch() {
//        refreshing.value = false
//        dataManager.fetchItems { [weak self] (items, error) in
//            self?.items.value = items ?? []
//            self?.error.value = error
//            self?.refreshing.value = false
//        }
//    }
}
