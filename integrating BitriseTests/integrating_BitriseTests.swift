//
//  integrating_BitriseTests.swift
//  integrating BitriseTests
//
//  Created by Andre Linces on 10/24/24.
//


import Nimble
import Quick

@testable import integrating_Bitrise // Make sure to import your app module


class ExampleViewModelSpec: QuickSpec {

    override func spec() {
        var viewModel: ViewModel!

        beforeEach {
            viewModel = ViewModel()
        }

        describe("numbersGreaterThanFifteen") { // testing number function
            it("returns numbers greater than 15") {
                let numbers = [10, 20, 30, 5]
                let result = viewModel.numbersGreaterThanFifteen(from: numbers)
                expect(result).to(equal([20, 30]))
                print("Result testNumbers \(result)")
            }

            it("returns an empty array when no numbers are greater than 15") {
                let numbers = [5, 10, 14]
                let result = viewModel.numbersGreaterThanFifteen(from: numbers)
                expect(result).to(beEmpty())
                print("Result testNumbers \(result)")
            }
        }

        describe("stringsStartingWithC") {
            it("returns strings starting with 'C'") {
                let strings = ["Cat", "Dog", "Car", "Apple", "Candle"]
                let result = viewModel.stringsStartingWithC(from: strings)
                expect(result).to(equal(["Cat", "Car", "Candle"]))
                print("Result testStrings \(result)")
            }

            it("returns an empty array if no strings start with 'C'") {
                let strings = ["Dog", "Apple", "Ball"]
                let result = viewModel.stringsStartingWithC(from: strings)
                expect(result).to(beEmpty())
                print("Result testStrings \(result)")
            }
        }
    }
}

