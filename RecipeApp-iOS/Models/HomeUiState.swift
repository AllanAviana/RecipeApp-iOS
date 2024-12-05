//
//  HomeUiState.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

struct HomeUiState {
    var american: [Meal] = []
    var italian: [Meal] = []
    var mexican: [Meal] = []
    var japanese: [Meal] = []
    var chinese: [Meal] = []
    var loading: Bool = false
    var success: Bool = false
    var error: String?
}
