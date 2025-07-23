//
//  DetailsView.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject var viewModel: MealViewModel
    var body: some View {
        if viewModel.detailsUiState.isLoading {
            DetailsLoadingView()
        }else {
            DetailsSuccessView(viewModel: viewModel)
        }
    }
}





