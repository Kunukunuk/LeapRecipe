//
//  RecipesResponseTests.swift
//  LeapRecipesTests
//
//  Created by Kun Huang on 11/5/24.
//

@testable import LeapRecipes
import XCTest
import Testing

struct RecipesResponseTests {
    @Test func test_recipeViewModel_getURL() {
        let viewModel = RecipesResponse.RecipeViewModel(
            cuisine: "Cuisine",
            name: "Name",
            photoUrlLarge: "https://www.testlarge.com",
            photoUrlSmall: "https://www.testsmall.com",
            uuid: "uuid",
            sourceUrl: "https://www.source.com",
            youtubeUrl: "https://www.youtube.com"
        )

        XCTAssertEqual(viewModel.getURL(.small), URL(string: "https://www.testlarge.com"))
        XCTAssertEqual(viewModel.getURL(.large), URL(string: "https://www.testsmall.com"))
        XCTAssertEqual(viewModel.getURL(.source), URL(string: "https://www.source.com"))
        XCTAssertEqual(viewModel.getURL(.youtube), URL(string: "https://www.youtube.com"))
    }
}
