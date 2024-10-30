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
        var viewModel: ViewModel!
        var viewController: ViewController!
        var cancellables = Set<AnyCancellable>()

        beforeEach {
            // Initialize with the default data providers
//            let numberProvider = DefaultNumberDataProvider(numbers: [11, 3, 35, 7, 9, 1, 13, 25, 17, 19])
//            let stringProvider = DefaultStringDataProvider(strings: ["Apple", "Cherry", "Banana", "Citrus"])
            
            //testing.... values from viewcontroller
            let numberProvider = DefaultNumberDataProvider()
            let stringProvider = DefaultStringDataProvider()
            
            viewModel = ViewModel(numberProvider: numberProvider, stringProvider: stringProvider)
            viewController = ViewController(viewModel: viewModel)
            
            // Trigger viewDidLoad to set up viewController
            _ = viewController.view
        }

        afterEach {
                    cancellables.removeAll()
                }
        
        //testing....
        
        
        describe("ViewController receiving ViewModel values") {
            context("when numbers are provided") {
                it("should contain some numbers") {
                    var receivedNumbers: [Int] = []
                    
                    viewController.$displayedNumbers
                        .sink { numbers in
                            receivedNumbers = numbers
                        }
                        .store(in: &cancellables)
                    
                    expect(receivedNumbers).toEventuallyNot(beEmpty())
                }
                
                it("should contain only numbers greater than 15") {
                    var receivedNumbers: [Int] = []
                    
                    viewController.$displayedNumbers
                        .sink { numbers in
                            receivedNumbers = numbers
                        }
                        .store(in: &cancellables)
                    
                    expect(receivedNumbers).toEventually(allPass { $0! > 15 })
                }
            }
        
        
        //testing....
        
        
//        describe("viewController with filtered data") {
//            it("displays numbers greater than 15") {
//                var receivedNumbers: [Int] = []
//                
//                // Subscribe to displayedNumbers in the viewController
//                viewController.$displayedNumbers
//                    .sink { numbers in
//                        receivedNumbers = numbers
//                    }
//                    .store(in: &cancellables)
//
//                expect(receivedNumbers).toEventuallyNot(beEmpty())
//                expect(receivedNumbers).toEventually(allPass { $0! > 15 })
//                
//                print("receivedNumbers: \(receivedNumbers)")
//            }

            
            
            it("displays strings that start with 'C'") {
                var receivedStrings: [String] = []
                
                // Subscribe to displayedStrings in the viewController
                viewController.$displayedStrings
                    .sink { strings in
                        receivedStrings = strings
                    }
                    .store(in: &cancellables)
                expect(receivedStrings).toEventuallyNot(beEmpty())
                expect(receivedStrings).toEventually(allPass { $0?.hasPrefix("C") == true })
                print("receivedStrings: \(receivedStrings)")
            }
        }
    }
}




//class ExampleViewControllerSpec: QuickSpec {
//    override func spec() {
//        var viewController: ViewController!
//        var mockDataProvider: MockNumberDataProvider!
//        
//        var cancellables = Set<AnyCancellable>()
//
//        beforeEach {
//            // Initialize with the default data provider and viewModel
//            
//            mockDataProvider = MockNumberDataProvider(numbers: [10, 20, 30, 55, 3, 77])
////            let viewModel = ViewModel(dataProvider: mockDataProvider)
//            
////            let viewModel = ViewModel(dataProvider: DefaultNumberDataProvider())
////            viewController = ViewController(viewModel: viewModel)
//            
//            // Trigger viewDidLoad to set up viewController
//            _ = viewController.view
//        }
//
//        describe("viewController with default viewModel data") {
//            it("displays filtered numbers from the default data provider") {
//                var receivedNumbers: [Int] = []
//                
//                // Subscribe to displayedNumbers in the viewController
//                viewController.$displayedNumbers
//                    .sink { numbers in
//                        receivedNumbers = numbers
//                    }
//                    .store(in: &cancellables)
//                
//                // Test that displayedNumbers matches the expected filtered numbers
////                expect(receivedNumbers).toEventually(equal([35, 25, 17, 19]))
////                expect(receivedNumbers).toEventually(equal([20, 30])) // Mock values
//                // Check that all received numbers are greater than 15
//                expect(receivedNumbers).toEventually(allPass { $0 ?? 00 > 15 })
//                print("receivedNumbers: \(receivedNumbers)")
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

