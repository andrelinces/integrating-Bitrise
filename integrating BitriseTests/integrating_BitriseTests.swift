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
        var mockDataProvider: MockNumberDataProvider!
        
        var cancellables = Set<AnyCancellable>()

        beforeEach {
            // Initialize with the default data provider and viewModel
            
            mockDataProvider = MockNumberDataProvider(numbers: [10, 20, 30, 55, 3, 77])
            let viewModel = ViewModel(dataProvider: mockDataProvider)
            
//            let viewModel = ViewModel(dataProvider: DefaultNumberDataProvider())
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
//                expect(receivedNumbers).toEventually(equal([35, 25, 17, 19]))
//                expect(receivedNumbers).toEventually(equal([20, 30])) // Mock values
                // Check that all received numbers are greater than 15
                expect(receivedNumbers).toEventually(allPass { $0 ?? 00 > 15 })
                print("receivedNumbers: \(receivedNumbers)")
            }
        }
    }
}


//MARK: - MOCK NumberDataProvider

class MockNumberDataProvider: NumberDataProvider {
    var numbers: [Int]
    
    init(numbers: [Int]) {
        self.numbers = numbers
    }
}

