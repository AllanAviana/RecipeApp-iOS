//
//  FeatureRow.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import SwiftUI

struct FeatureRow: View {
    var body: some View {
        HStack(alignment: .top) {
            FeatureItem(
                image: "SpoonForkIcon",
                title: "Recipes",
                isMultiline: false
            )
            Spacer()
            FeatureItem(
                image: "WelcomeHeart",
                title: "Save your\n favorite recipes",
                isMultiline: true
            )
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 50)
    }
}
