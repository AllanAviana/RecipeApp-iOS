//
//  WelcomeText.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import SwiftUI

struct WelcomeText: View {
    @State private var gradientOffset: CGFloat = -1.0

    var body: some View {
        ZStack {
            Text("Welcome to\nFoodApp")
                .font(.custom("HelveticaNeue-Bold", size: 32))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .mask(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .clear, .white, .clear
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: 300, height: 100)
                    .offset(x: gradientOffset * 300)
                    .onAppear {
                        withAnimation(
                            Animation.linear(duration: 1)
                        ) {
                            gradientOffset = 0
                        }
                    }
                )
        }
    }
}
