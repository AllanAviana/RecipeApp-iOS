//
//  StartButton.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import SwiftUI

struct StartButton: View {
    var body: some View {
        NavigationLink(destination: HomeView()) {
            Text("Start")
                .font(.custom("", size: 20))
                .frame(width: 331, height: 58)
                .foregroundColor(.white)
                .background(Color("DeepBordeaux"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .zIndex(1)
        .padding(.top, 40)
    }
}
