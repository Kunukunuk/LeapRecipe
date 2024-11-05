//
//  File.swift
//  LeapRecipes
//
//  Created by Kun Huang on 11/4/24.
//

import Foundation

struct RecipesResponse: Decodable {
    let recipes: [RecipeViewModel]

    struct RecipeViewModel: Decodable, Identifiable, Equatable {
        var id: String {
            uuid
        }

        let cuisine: String
        let name: String
        let photoUrlLarge: String?
        let photoUrlSmall: String?
        let uuid: String
        let sourceUrl: String?
        let youtubeUrl: String?

        func getURL(_ type: URLType) -> URL? {
            switch type {
            case .large:
                return URL(string: photoUrlLarge ?? "")
            case .small:
                return URL(string: photoUrlSmall ?? "")
            case .source:
                return URL(string: sourceUrl ?? "")
            case .youtube:
                return URL(string: youtubeUrl ?? "")
            }
        }
    }

    enum URLType {
        case large
        case small
        case source
        case youtube
    }
}
