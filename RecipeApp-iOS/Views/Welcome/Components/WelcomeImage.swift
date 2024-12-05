//
//  WelcomeImage.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import SwiftUI

struct WelcomeImage: View {
    let geometry: GeometryProxy
    
    var body: some View {
        Image("WelcomeImage")
            .resizable()
            .scaledToFill()
            .frame(height: geometry.size.height * 0.45)
            .padding(.horizontal)
    }
}
