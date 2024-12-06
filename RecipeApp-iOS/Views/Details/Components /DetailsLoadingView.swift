//
//  DetailsLoadingView.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 05/12/24.
//

import SwiftUI
import SwiftfulLoadingIndicators


struct DetailsLoadingView: View{
    var body: some View{
        ZStack{
            VStack(alignment: .center) {
                
                LoadingIndicator(animation: .threeBallsTriangle,color: .white, size: .large, speed: .normal)

            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
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


#Preview {
    DetailsLoadingView()
}
