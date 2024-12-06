//
//  API.swift
//  RecipeApp-iOS
//
//  Created by Allan Viana on 04/12/24.
//
import Foundation

struct API {
    static let baseURL = "https://www.themealdb.com/api/json/v1/1"
    static func getMeals(for area: String) -> URL? {
        return URL(string: "\(baseURL)/filter.php?a=\(area)")
    }
    static func getMeal(by id: String) -> URL? {
        return URL(string: "\(baseURL)/lookup.php?i=\(id)")
    }
}
