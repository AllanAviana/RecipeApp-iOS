//
//  HomeView.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//

import SwiftUI
import SwiftfulLoadingIndicators


struct HomeView: View {
    @EnvironmentObject var mealViewModel: MealViewModel
    var body: some View {
        if mealViewModel.homeUiState.loading == true {
            HomeLoading()
        }else if mealViewModel.homeUiState.success == true {
            HomeSuccess(mealViewModel: mealViewModel)
        }
    }
}


struct HomeLoading: View {
    var body: some View {
            
            ZStack(alignment: .top) {
                Color.darkMaroon
                    .ignoresSafeArea()
                
                VStack {
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
                            .font(.callout)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .offset(y: 120)
                    }
                    Spacer().frame(height: 180)
                    
                    LoadingIndicator(color: Color.white, size: .large, speed: .normal)
                    
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)

        }
}


struct HomeSuccess: View {
    let mealViewModel: MealViewModel
    var body: some View {
        
            let list = ["american", "italian", "mexican", "chinese", "japanese"]
            
            ZStack(alignment: .top) {
                Color.darkMaroon
                    .ignoresSafeArea()
                
                VStack {
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
                            .font(.callout)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .offset(y: 120)
                    }
                    
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(list, id: \.self) { category in
                                Text(category.capitalized)
                                    .font(.headline)
                                    .padding(.leading, 32)
                                    .foregroundColor(.white)
                                
                                let recipes: [Meal] = {
                                    switch category {
                                    case "american":
                                        return mealViewModel.homeUiState.american
                                    case "mexican":
                                        return mealViewModel.homeUiState.mexican
                                    case "italian":
                                        return mealViewModel.homeUiState.italian
                                    case "japanese":
                                        return mealViewModel.homeUiState.japanese
                                    case "chinese":
                                        return mealViewModel.homeUiState.chinese
                                    default:
                                        return []
                                    }
                                }()
                                
                                ScrollView(.horizontal, showsIndicators: false) {                            LazyHStack(alignment: .top, spacing: 8) {
                                    ForEach(recipes, id: \.idMeal) { recipe in
                                       RecipeCard(recipe: recipe, viewModel: mealViewModel)
                                    }.padding(.horizontal, 8)
                                }.padding(.horizontal, 20)
                                }
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }
    }




struct RecipeCard: View {
    let recipe: Meal
    let viewModel: MealViewModel

    var body: some View {
        Button(action: { }) {
                ZStack {
                    VStack {
                        AsyncImage(url: URL(string: recipe.strMealThumb)) { image in
                            image.resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 180, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: Color(red: 233 / 255, green: 175 / 255, blue: 143 / 255, opacity: 0.5), radius: 4, x: 3, y: 3)

                        Text(recipe.strMeal)
                            .font(.custom("", size: 16))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .offset(y: 5)
                    }
                }
                .frame(width: 180, height: 200, alignment: .top)
            }
        .buttonStyle(PlainButtonStyle())
    }
}
