//
//  integrating_BitriseTests.swift
//  integrating BitriseTests
//
//  Created by Andre Linces on 10/24/24.
//


import Nimble
import Quick
import Combine

@testable import integrating_Bitrise // Make sure to import your app module


class ExampleViewControllerSpec: QuickSpec {
    override func spec() {
        var viewController: ViewController!
        var cancellables = Set<AnyCancellable>()

        beforeEach {
            // Initialize with the default data provider and viewModel
            let viewModel = ViewModel(dataProvider: DefaultNumberDataProvider())
            viewController = ViewController(viewModel: viewModel)
            
            // Trigger viewDidLoad to set up viewController
            _ = viewController.view
        }

        describe("viewController with default viewModel data") {
            it("displays filtered numbers from the default data provider") {
                var receivedNumbers: [Int] = []
                
                // Subscribe to displayedNumbers in the viewController
                viewController.$displayedNumbers
                    .sink { numbers in
                        receivedNumbers = numbers
                    }
                    .store(in: &cancellables)
                
                // Test that displayedNumbers matches the expected filtered numbers
                expect(receivedNumbers).toEventually(equal([35, 25, 17, 19]))
            }
        }
    }
}


//class ExampleViewControllerSpec: QuickSpec {
//    override func spec() {
//        var viewController: ViewController!
//        var mockDataProvider: MockNumberDataProvider!
//        var viewModel: ViewModel!
//
//        beforeEach {
//            mockDataProvider = MockNumberDataProvider(numbers: [10, 20, 30, 5])
//            viewModel = ViewModel(dataProvider: mockDataProvider)
//            viewController = ViewController(viewModel: viewModel)
//            
//            // Trigger viewDidLoad
//            _ = viewController.view
//        }
//
//        describe("viewDidLoad") {
//            it("displays numbers greater than 15") {
//                let result = viewModel.numbersGreaterThanFifteen()
//                expect(result).to(equal([20, 30]))
//                print("Test result \(result)")
//                // Optionally, verify additional behaviors or UI updates if applicable
//            }
//        }
//    }
//}



//class ExampleViewModelSpec: QuickSpec {
//
//    override func spec() {
//        var viewModel: ViewModel!
//        var mockDataProvider: MockNumberDataProvider!
//        beforeEach {
//            viewModel = ViewModel(dataProvider: mockDataProvider)
//        }
//
//        describe("numbersGreaterThanFifteen") {
//                    it("returns numbers greater than 15") {
//                        mockDataProvider = MockNumberDataProvider(numbers: [10, 20, 30, 5])
//                        viewModel = ViewModel(dataProvider: mockDataProvider)
//                        
//                        let result = viewModel.numbersGreaterThanFifteen()
//                        expect(result).to(equal([20, 30]))
//                    }
//
//            it("returns an empty array when no numbers are greater than 15") {
//                let numbers = [5, 10, 14]
//                let result = viewModel.numbersGreaterThanFifteen()
//                expect(result).to(beEmpty())
//                print("Result testNumbers \(result)")
//            }
//        }
//
//        describe("stringsStartingWithC") {
//            it("returns strings starting with 'C'") {
//                let strings = ["Cat", "Dog", "Car", "Apple", "Candle"]
//                let result = viewModel.stringsStartingWithC(from: strings)
//                expect(result).to(equal(["Cat", "Car", "Candle"]))
//                print("Result testStrings \(result)")
//            }
//
//            it("returns an empty array if no strings start with 'C'") {
//                let strings = ["Dog", "Apple", "Ball"]
//                let result = viewModel.stringsStartingWithC(from: strings)
//                expect(result).to(beEmpty())
//                print("Result testStrings \(result)")
//            }
//        }
//    }
//}

//MARK: - MOCK NumberDataProvider

class MockNumberDataProvider: NumberDataProvider {
    var numbers: [Int]
    
    init(numbers: [Int]) {
        self.numbers = numbers
    }
}

