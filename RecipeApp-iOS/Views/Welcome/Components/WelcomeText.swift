//
//  WelcomeText.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import SwiftUI

struct WelcomeText: View {
    var body: some View {
        Text("Welcome to\nFoodApp")
            .font(.custom("", size: 32))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
    }
}
