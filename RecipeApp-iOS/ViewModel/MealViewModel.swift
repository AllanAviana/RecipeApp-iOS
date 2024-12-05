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

    private var cancellables = Set<AnyCancellable>()
    private let repository = MealRepository()

    init() {
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

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                    self.loadMeals()
                }
            }
            .store(in: &cancellables)
    }
}
