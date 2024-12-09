//
//  Ingredients .swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

import SwiftUI

struct Ingredients_: View {
    let viewModel: MealViewModel
    @State private var visibleIngredients: Set<Int> = []
    
    var body: some View {
        VStack(alignment: .leading) {
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
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 20)
            
           
                ForEach(viewModel.detailsUiState.ingredients.indices, id: \.self) { index in
                    if visibleIngredients.contains(index) {
                        IngredientsRow(ingredients: viewModel.detailsUiState.ingredients[index])
                            .transition(.move(edge: .leading).combined(with: .opacity)) 
                            .animation(.easeOut(duration: 0.5).delay(Double(index) * 0.2), value: visibleIngredients)
                    }
                }.padding(.top, 1)
        }
        .onAppear {
            
            for index in viewModel.detailsUiState.ingredients.indices {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
                    withAnimation {
                        _ = visibleIngredients.insert(index)
                    }
                }
            }
        }

        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
