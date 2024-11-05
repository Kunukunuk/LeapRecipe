//
//  RecipesViewModel.swift
//  LeapRecipes
//
//  Created by Kun Huang on 11/4/24.
//

import UIKit
import SwiftUI

class RecipeViewModel: ObservableObject {
    let recipe: RecipesResponse.RecipeViewModel

    init(recipe: RecipesResponse.RecipeViewModel) {
        self.recipe = recipe
    }
}
