//
//  ContentView.swift
//  LeapRecipes
//
//  Created by Kun Huang on 11/4/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        NavigationView {
            List {
                if let errorMessage = viewModel.displayErrorText {
                    Text(errorMessage)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                } else {
                    ForEach(viewModel.recipes) { recipe in
                        NavigationLink(destination: RecipeFullView(recipe: recipe)) {
                            RecipeView(viewModel: RecipeViewModel(recipe: recipe))
                                .alignmentGuide(.listRowSeparatorLeading, computeValue: { _ in
                                    return 0
                                })
                        }
                    }
                }
            }
            .navigationTitle("Recipe List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.getData(.allRecipe)
                    }) {
                        Image(systemName: "arrow.clockwise")
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.getData(.empty)
                    }) {
                        Image(systemName: "circle")
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.getData(.malformed)
                    }) {
                        Image(systemName: "exclamationmark.triangle")
                    }
                }
            }
            .onAppear {
                viewModel.getData(.allRecipe)
            }
        }
    }
}

#Preview {
    ContentView()
}
