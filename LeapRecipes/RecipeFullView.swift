//
//  RecipeFullView.swift
//  LeapRecipes
//
//  Created by Kun Huang on 11/5/24.
//

import SwiftUI

struct RecipeFullView: View {
    var recipe: RecipesResponse.RecipeViewModel

    var body: some View {
        ScrollView {
            AsyncImage(url: recipe.getURL(.large)) { phase in
                switch phase {
                case let .success(image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure, .empty:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                default:
                    ProgressView()
                }
            }
            .frame(minHeight: 200)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            Text(recipe.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            Text(recipe.cuisine)
                .padding(.bottom, 10)
            if let sourceUrl = recipe.getURL(.source) {
                Link(destination: sourceUrl) {
                    Text("Follow recipe on site")
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 10)
            }
            if let sourceUrl = recipe.getURL(.youtube) {
                Link(destination: sourceUrl) {
                    Text("Look at recipe on Youtube")
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    RecipeFullView(recipe: RecipesResponse.RecipeViewModel(cuisine: "Cuisine", name: "Name", photoUrlLarge: nil, photoUrlSmall: nil, uuid: "uuid", sourceUrl: nil, youtubeUrl: nil))
}
