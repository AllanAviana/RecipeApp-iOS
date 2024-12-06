//
//  HorizontalRecipeList.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct HorizontalRecipeList: View {
    let category: String
    let mealViewModel: MealViewModel

    private var recipes: [Meal] {
        switch category {
        case "american":
            return mealViewModel.homeUiState.american
        case "mexican":
            return mealViewModel.homeUiState.mexican
        case "italian":
            return mealViewModel.homeUiState.italian
        case "japanese":
            return mealViewModel.homeUiState.japanese
        case "chinese":
            return mealViewModel.homeUiState.chinese
        default:
            return []
        }
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 8) {
                ForEach(recipes, id: \.idMeal) { recipe in
                    RecipeCard(recipe: recipe, viewModel: mealViewModel)
                }
                .padding(.horizontal, 8)
            }
            .padding(.horizontal, 20)
        }
    }
}
