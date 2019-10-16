//
//  RecipeTableViewCell.swift
//  HelloFreshv3
//
//  Created by Pablo de la Rosa Michicol on 10/12/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameRecipe: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
