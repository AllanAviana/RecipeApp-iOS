//
//  MealRepository.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import Foundation
import Combine

class MealRepository {
    private let networkLayer = NetworkLayer()
    
    func fetchMeals(for area: String) -> AnyPublisher<[Meal], Error> {
        guard let url = API.getMeals(for: area) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return networkLayer.fetchData(from: url)
            .map { (response: MealResponse) in response.meals }
            .eraseToAnyPublisher()
    }
}
