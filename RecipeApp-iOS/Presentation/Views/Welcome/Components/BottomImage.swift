//
//  BottomImage.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import SwiftUI

struct BottomImage: View {
    let geometry: GeometryProxy
    
    var body: some View {
        Image("BottomWelcomeImage")
            .resizable()
            .frame(height: geometry.size.height * 0.45)
            .ignoresSafeArea(edges: .bottom)
    }
}
