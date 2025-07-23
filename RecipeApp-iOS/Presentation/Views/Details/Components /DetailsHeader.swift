//
//  DetailsHeader.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct DetailsHeader: View {
    @Environment(\.presentationMode) var presentationMode

    let viewModel: MealViewModel
    var body: some View {
        ZStack(alignment: .topLeading) {
            AsyncImage(url: URL(string: viewModel.detailsUiState.image)){ image in
                image.resizable()
                    .scaledToFill()
                    
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .frame(width: 32, height: 32)
                    .background(Color.white)
                    .clipShape(Circle())
            }
            .padding(.top, 40)
            .padding(.leading, 20)
        }
        Text(viewModel.detailsUiState.name)
            .font(.title)
            .foregroundColor(.white)
            .frame(height: 63)
            .frame(maxWidth: .infinity)
            .background(Color(.darkWine))
            .clipShape(RoundedCorners(corners: [.bottomLeft, .bottomRight], radius: 16))
            .shadow(color: Color.black.opacity(0.4), radius: 8, x: 0, y: 4)
    }
}
