//
//  HomeSuccess.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct HomeSuccess: View {
    let mealViewModel: MealViewModel
    private let categories = ["american", "italian", "mexican", "chinese", "japanese"]

    var body: some View {
        ZStack(alignment: .top) {
            Color.darkMaroon
                .ignoresSafeArea()

            VStack {
                MainHeader()

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(categories, id: \.self) { category in
                            CategorySection(category: category, mealViewModel: mealViewModel)
                        }
                    }
                    .padding(.top, 16)
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}
