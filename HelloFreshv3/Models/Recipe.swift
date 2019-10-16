//
//  Recipe.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/7/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import Foundation

struct Recipe: Codable {
    var name: String?
    var proteins: String?
    var image: String?
    var isLike: Bool?
//    var rating: String?
}
