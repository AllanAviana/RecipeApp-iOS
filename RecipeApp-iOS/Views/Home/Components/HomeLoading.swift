//
//  HomeLoading.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI
import SwiftfulLoadingIndicators

struct HomeLoading: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.darkMaroon
                .ignoresSafeArea()

            VStack(spacing: 40) {
                MainHeader()
                Spacer().frame(height: 180)
                LoadingIndicator(color: .white, size: .large, speed: .normal)
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}
