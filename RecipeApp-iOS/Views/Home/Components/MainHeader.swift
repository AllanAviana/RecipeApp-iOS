//
//  MainHeader.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct MainHeader: View {
    var body: some View {
        ZStack {
            Image("MainHomeImage")
                .resizable()
                .scaledToFill()
                .frame(height: 373)

            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 200)
                .offset(x: 10)

            Text("Get ready to know several kinds \nof recipes")
                .font(.custom("HelveticaNeue-Black", size: 15))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .offset(y: 120)
        }
    }
}
