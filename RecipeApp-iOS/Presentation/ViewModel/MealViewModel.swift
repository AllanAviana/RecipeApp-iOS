//
//  MealViewModel.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import Combine
import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var homeUiState: HomeUiState = HomeUiState()
    @Published var detailsUiState: DetailsUiState = DetailsUiState()

    private var cancellables = Set<AnyCancellable>()
    private let repository: MealRepositoryProtocol

    init(repository: MealRepositoryProtocol = MealRepository()) {
        self.repository = repository
        loadMeals()
    }

    var countries = ["american", "mexican", "italian", "japanese", "chinese"]

    func loadMeals() {

        homeUiState.loading = true
        homeUiState.error = nil

        guard let country = countries.first else {
            homeUiState.loading = false
            homeUiState.success = true
            return
        }

        repository.fetchMeals(for: country)
            .sink { completion in
                if case let .failure(error) = completion {
                    self.homeUiState.error = error.localizedDescription
                }
            } receiveValue: { [self] meals in
                switch country {
                case "american":
                    homeUiState.american = meals
                case "mexican":
                    homeUiState.mexican = meals
                case "italian":
                    homeUiState.italian = meals
                case "japanese":
                    homeUiState.japanese = meals
                case "chinese":
                    homeUiState.chinese = meals
                default:
                    print("Unknown country")
                }

                self.countries.removeFirst()

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.loadMeals()
                }
            }
            .store(in: &cancellables)
    }

    func loadDetails(id: String) {

        detailsUiState.isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.repository.fetchMeal(with: id)
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case .finished:
                            break
                        case .failure(_):
                            self.detailsUiState.iserror = true
                        }
                    },
                    receiveValue: { details in
                        guard let mealDetail = details.first else {
                            print("No meal details found")
                            return
                        }

                        self.detailsUiState.image = mealDetail.strMealThumb
                        self.detailsUiState.name = mealDetail.strMeal
                        self.detailsUiState.instructions =
                            mealDetail.strInstructions
                        self.detailsUiState.ingredients = [
                            mealDetail.strIngredient1,
                            mealDetail.strIngredient2,
                            mealDetail.strIngredient3,
                            mealDetail.strIngredient4,
                            mealDetail.strIngredient5,
                            mealDetail.strIngredient6,
                            mealDetail.strIngredient7,
                            mealDetail.strIngredient8,
                            mealDetail.strIngredient9,
                            mealDetail.strIngredient10,
                            mealDetail.strIngredient11,
                            mealDetail.strIngredient12,
                            mealDetail.strIngredient13,
                            mealDetail.strIngredient14,
                            mealDetail.strIngredient15,
                            mealDetail.strIngredient16,
                            mealDetail.strIngredient17,
                            mealDetail.strIngredient18,
                            mealDetail.strIngredient19,
                            mealDetail.strIngredient20,
                        ].compactMap { $0 }.filter { !$0.isEmpty }

                        self.detailsUiState.isLoading = false
                        self.detailsUiState.isSuccess = true
                    }
                )
                .store(in: &self.cancellables)
        }
    }
}
