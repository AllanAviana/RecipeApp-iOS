//
//  NetworkLayer.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import Combine
import Foundation

struct NetworkLayer {
    func fetchData<T: Decodable>(from url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
