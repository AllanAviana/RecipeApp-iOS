//
//  HomeView.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mealViewModel: MealViewModel

    var body: some View {
        Group {
            if mealViewModel.homeUiState.loading {
                HomeLoading()
            } else if mealViewModel.homeUiState.success {
                HomeSuccess(mealViewModel: mealViewModel)
            }
        }
    }
}
