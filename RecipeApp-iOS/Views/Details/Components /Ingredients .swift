//
//  Ingredients .swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct Ingredients_: View {
    let viewModel: MealViewModel
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Text("Ingredients")
                .font(.headline)
                .foregroundStyle(.darkBurgundy)
                .padding(.leading, 40)
                .frame(width: 309, height: 42, alignment: .leading)
                .background(.bloodRed)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.leading, 15)
            
            Image("Image 1")
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10 )
            .padding(.top, 20)
        
        ForEach(viewModel.detailsUiState.ingredients, id: \.self){
            ingredient in
            IngredientsRow(ingredients: ingredient)
        }
    }
}
