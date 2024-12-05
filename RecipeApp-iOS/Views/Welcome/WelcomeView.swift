//
//  WelcomeView.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 03/12/24.
//

import SwiftUI

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack(alignment: .bottom) {
                    BackgroundGradient()
                    
                    VStack(spacing: geometry.size.height * 0.07) {
                        WelcomeText()
                        WelcomeImage(geometry: geometry)
                        Spacer()
                    }
                    .padding(.top, geometry.size.height * 0.14)
                    
                    BottomSection(geometry: geometry)
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
