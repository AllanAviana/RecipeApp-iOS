//
//  Instructions.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct Instructions: View {
    let viewModel: MealViewModel
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Text("Instructions")
                .font(.headline)
                .foregroundStyle(.darkBurgundy)
                .padding(.leading, 40)
                .frame(width: 309, height: 42, alignment: .leading)
                .background(.bloodRed)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.leading, 15)
            
            Image("Spoon")
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10 )
            .padding(.top, 10)
        
        HStack(alignment: .bottom) {
            
            Text(viewModel.detailsUiState.instructions)
                .font(.custom("", size: 14))
                .foregroundStyle(.white)
            
        }.padding(.vertical, 20).frame(maxWidth: .infinity, alignment: .bottomLeading).padding(.horizontal, 40)    }
}
