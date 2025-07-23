//
//  FakeMealRepository.swift
//  RecipeApp-iOSTests
//
//  Created by Allan Viana on 23/07/25.
//

import Combine
@testable import RecipeApp_iOS

final class FakeMealRepository: MealRepositoryProtocol {
    var mealsResult: Result<[Meal], Error> = .success([
        Meal(idMeal: "1", strMeal: "Fake American", strMealThumb: "thumb")
    ])
    var detailsResult: Result<[Details], Error> = .success([
        Details(
            idMeal: "1",
            strMeal: "Fake Meal",
            strMealThumb: "thumb",
            strCategory: "Cat",
            strArea: "Area",
            strInstructions: "Cook...",
            strTags: nil, strYoutube: nil,
            strIngredient1: "Sugar",
            strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil,
            strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil,
            strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil,
            strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil,
            strMeasure1: nil, strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil,
            strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil,
            strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil,
            strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil
        )
    ])

    func fetchMeals(for area: String) -> AnyPublisher<[Meal], Error> {
        mealsResult.publisher.eraseToAnyPublisher()
    }

    func fetchMeal(with id: String) -> AnyPublisher<[Details], Error> {
        detailsResult.publisher.eraseToAnyPublisher()
    }
}
