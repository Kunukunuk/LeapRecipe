//
//  RecipeView.swift
//  LeapRecipes
//
//  Created by Kun Huang on 11/4/24.
//

import SwiftUI

struct RecipeView: View {
    var viewModel: RecipeViewModel

    var body: some View {
        HStack {
            AsyncImage(url: viewModel.recipe.getURL(.small)) { phase in
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
            .frame(width: 80, height: 80)
            .cornerRadius(8)
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.recipe.name)
                    .font(.title)
                    .fontWeight(.semibold)
                Text(viewModel.recipe.cuisine)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    RecipeView(viewModel: .init(recipe:  RecipesResponse.RecipeViewModel(cuisine: "Cuisine", name: "Name", photoUrlLarge: nil, photoUrlSmall: nil, uuid: "uuid", sourceUrl: nil, youtubeUrl: nil)))
}
