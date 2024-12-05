//
//  RecipeApp_iOSApp.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 03/12/24.
//

import SwiftUI

@main
struct RecipeApp_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView().environmentObject(MealViewModel())
        }
    }
}
