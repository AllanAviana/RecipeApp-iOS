//
//  BottomSection.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import SwiftUI

struct BottomSection: View {
    let geometry: GeometryProxy
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                StartButton()
                FeatureRow()
                    .padding(.top, 40)
            }
            .zIndex(1)
            
            BottomImage(geometry: geometry)
        }
    }
}
