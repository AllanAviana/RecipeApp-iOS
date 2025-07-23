//
//  MealViewModelTests.swift
//  RecipeApp-iOSTests
//
//  Created by Allan Viana on 23/07/25.
//

import Combine
import XCTest

@testable import RecipeApp_iOS

final class MealViewModelTests: XCTestCase {

    private var cancellables = Set<AnyCancellable>()

    func test_loadMeals_success() {
        let fake = FakeMealRepository()
        let vm = MealViewModel(repository: fake)
        vm.countries = ["american"]

        let exp = expectation(description: "home state success")

        var cancellable: AnyCancellable?
        cancellable = vm.$homeUiState
            .dropFirst()
            .filter { $0.success }
            .prefix(1)  
            .sink { state in
                XCTAssertFalse(state.american.isEmpty)
                exp.fulfill()
                cancellable?.cancel()
            }

        vm.loadMeals()
        wait(for: [exp], timeout: 2.0)
    }

    func test_loadMeals_error() {
        let fake = FakeMealRepository()
        fake.mealsResult = .failure(URLError(.badServerResponse))

        let vm = MealViewModel(repository: fake)
        vm.countries = ["american"]

        let exp = expectation(description: "home state error")

        var cancellable: AnyCancellable?
        cancellable = vm.$homeUiState
            .dropFirst()
            .filter { $0.error != nil }
            .prefix(1)
            .sink { state in
                XCTAssertNotNil(state.error)
                XCTAssertTrue(state.american.isEmpty)
                exp.fulfill()
                cancellable?.cancel()
            }

        vm.loadMeals()

        wait(for: [exp], timeout: 2.0)
    }


    func test_loadDetails_success() {
        let fake = FakeMealRepository()
        let vm = MealViewModel(repository: fake)

        let exp = expectation(description: "details success")

        vm.$detailsUiState
            .dropFirst()
            .sink { state in
                if state.isSuccess {
                    XCTAssertEqual(state.name, "Fake Meal")
                    XCTAssertTrue(state.ingredients.contains("Sugar"))
                    exp.fulfill()
                }
            }
            .store(in: &cancellables)

        vm.loadDetails(id: "1")

        wait(for: [exp], timeout: 2.0)
    }

    func test_loadDetails_error() {
        let fake = FakeMealRepository()
        fake.detailsResult = .failure(URLError(.badServerResponse))

        let vm = MealViewModel(repository: fake)

        let exp = expectation(description: "details error")

        vm.$detailsUiState
            .dropFirst()
            .sink { state in
                if state.iserror {
                    XCTAssertFalse(state.isSuccess)
                    exp.fulfill()
                }
            }
            .store(in: &cancellables)

        vm.loadDetails(id: "1")

        wait(for: [exp], timeout: 2.0)
    }
}
