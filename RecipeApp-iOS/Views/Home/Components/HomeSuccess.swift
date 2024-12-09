//
//  HomeSuccess.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct HomeSuccess: View {
    @State private var resetTrigger: Bool = false 
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
                                .id(resetTrigger) // Força recriação do layout
                        }
                    }
                    .padding(.top, 16)
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .onAppear {
            resetScreen()
        }
    }

    private func resetScreen() {
        resetTrigger.toggle()
    }
}
