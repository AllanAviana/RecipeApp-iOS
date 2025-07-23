//
//  IngredientsRow.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct IngredientsRow: View{
    let ingredients: String?
    var body: some View{
        HStack(alignment: .bottom) {
            Circle()
                .fill(.bloodRed)
                .frame(width: 12, height: 12)
            
            Text(ingredients ?? "")
                .font(.custom("", size: 14))
                .foregroundStyle(.white)
            
        }.padding(.top, 8).frame(maxWidth: .infinity, alignment: .bottomLeading).padding(.horizontal, 30)
    }
}
