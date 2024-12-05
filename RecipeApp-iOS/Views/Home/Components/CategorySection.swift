//
//  CategorySection.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct CategorySection: View {
    let category: String
    let mealViewModel: MealViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(category.capitalized)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.leading, 32)

            HorizontalRecipeList(category: category, mealViewModel: mealViewModel)
        }
    }
}
