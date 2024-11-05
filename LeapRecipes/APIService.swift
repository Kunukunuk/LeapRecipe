//
//  APIService.swift
//  LeapRecipes
//
//  Created by Kun Huang on 11/4/24.
//

import Foundation
import Combine

class APIService: ObservableObject {
    private var cancellables = Set<AnyCancellable>()

    func getData(stringURL: String, completion: @escaping (Result<RecipesResponse, APIError>) -> Void) {
        guard let url = URL(string: stringURL) else {
            completion(.failure(.badURL))
            return
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RecipesResponse.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case let .failure(error):
                    print(error.localizedDescription)
                    completion(.failure(.decodingFailed))
                case .finished:
                    break
                }
            }, receiveValue: { recipes in
                completion(.success(recipes))
            })
            .store(in: &cancellables)
    }
}

enum APIError: Error {
    case badURL
    case requestFailed
    case decodingFailed
}
