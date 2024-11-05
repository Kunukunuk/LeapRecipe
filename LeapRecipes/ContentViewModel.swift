//
//  ContentViewModel.swift
//  LeapRecipes
//
//  Created by Kun Huang on 11/4/24.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published private var apiService = APIService()
    @Published var recipes: [RecipesResponse.RecipeViewModel] = []
    @Published var displayErrorText: String?

    func getData(_ string: TestJSON) {
        apiService.getData(stringURL: string.rawValue) { [weak self] result in
            switch result {
            case let .success(response):
                print("Data fetched successfully: \(response)")
                self?.recipes = response.recipes
                self?.displayErrorText = response.recipes.isEmpty ? "There is no recipes" : nil
            case let .failure(error):
                self?.displayErrorText = "Invalid JSON from backend"
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }

    enum TestJSON: String {
        case allRecipe = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        case empty = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
        case malformed = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    }
}
