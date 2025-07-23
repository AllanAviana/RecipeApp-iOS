//
//  DetailsUiState.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import Foundation

struct DetailsUiState {
    var image: String = ""
    var name: String = ""
    var ingredients: [String?] = []
    var instructions: String = ""
    var iserror: Bool = false
    var isLoading: Bool = false
    var isSuccess: Bool = false
}
