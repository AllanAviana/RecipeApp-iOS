//
//  RecipeCard.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: Meal
    let viewModel: MealViewModel

    var body: some View {
        NavigationLink(
            destination: {
                DetailsView()
                    .onAppear {
                        viewModel.loadDetails(id: recipe.idMeal)
                    }
            }) {
                VStack {
                    AsyncImage(url: URL(string: recipe.strMealThumb)) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 180, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(
                        color: Color(
                            red: 233 / 255, green: 175 / 255, blue: 143 / 255,
                            opacity: 0.5), radius: 4, x: 3, y: 3)

                    Text(recipe.strMeal)
                        .font(.custom("", size: 16))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .offset(y: 5)
                }
                .frame(width: 180, height: 200, alignment: .top)
            }
            .buttonStyle(PlainButtonStyle())
    }
}
