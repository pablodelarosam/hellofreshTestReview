//
//  RecipeService.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/7/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import Foundation

protocol RecipeServiceProtocol {
    func requestRecipes(_ endpoint: String, completionHandler: @escaping (Result<[Recipe], Error>) -> Void)
    func saveFavoriteRecipe(with recipes: [Recipe])
}

class RecipeService: RecipeServiceProtocol {

    func requestRecipes(_ endpoint: String, completionHandler: @escaping (Result<[Recipe], Error>) -> Void) {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
           let path = documentsURL!.appendingPathComponent("recipes").appendingPathExtension("json")
               do {
                   print(path.absoluteString)
                   let data = try? Data(contentsOf: path, options: .mappedIfSafe)
                   if let data = data {
                       let recipes = try JSONDecoder().decode([Recipe].self, from: data)
                       DispatchQueue.main.async {
                           completionHandler(.success(recipes))
                       }
                   }
               } catch {
                   completionHandler(.failure(error))
               }
    }
    
    func saveFavoriteRecipe(with recipes: [Recipe]) {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let path = documentsURL!.appendingPathComponent("recipes").appendingPathExtension("json")
        do {
            print(path.absoluteString)
            let json = try JSONEncoder().encode(recipes)
            try json.write(to: path)
        } catch {
        }

    }
    
}
