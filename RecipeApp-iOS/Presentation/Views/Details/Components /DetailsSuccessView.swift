//
//  DetailsSuccessView.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct DetailsSuccessView: View{
    @Environment(\.presentationMode) var presentationMode
    let viewModel: MealViewModel
    var body: some View{
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    
                    DetailsHeader(viewModel: viewModel)
                    
                    Ingredients_(viewModel: viewModel)
                    
                    Instructions(viewModel: viewModel)
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color("CrimsonShade"), location: 0.58),
                        .init(color: Color("DeepRed"), location: 1)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }
    }
}
