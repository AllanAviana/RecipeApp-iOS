//
//  FeatureItem.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import SwiftUI

struct FeatureItem: View {
    let image: String
    let title: String
    let isMultiline: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Image(image)
                .resizable()
                .padding(15)
                .frame(width: 99, height: 96)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(.lightGray, lineWidth: 3)
                )
            
            if isMultiline {
                Text(title)
                    .multilineTextAlignment(.center)
                    .font(.custom("", size: 20))
            } else {
                Text(title)
                    .font(.custom("", size: 20))
            }
        }
    }
}

