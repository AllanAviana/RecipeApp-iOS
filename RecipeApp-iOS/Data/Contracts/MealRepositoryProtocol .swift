//
//  MealRepositoryProtocol .swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 23/07/25.
//

import Combine

protocol MealRepositoryProtocol {
    func fetchMeals(for area: String) -> AnyPublisher<[Meal], Error>
    func fetchMeal(with id: String) -> AnyPublisher<[Details], Error>
}
