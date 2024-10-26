//
//  ViewController.swift
//  integrating Bitrise
//
//  Created by Andre Linces on 10/23/24.
//

import UIKit
import SnapKit
import Combine

class ViewController: UIViewController {
    private var viewModel: ViewModel
    @Published var displayedNumbers: [Int] = [] // New published property
    private var cancellables = Set<AnyCancellable>()

    init(viewModel: ViewModel = ViewModel(dataProvider: DefaultNumberDataProvider())) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        let defaultDataProvider = DefaultNumberDataProvider()
        self.viewModel = ViewModel(dataProvider: defaultDataProvider)
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.$filteredNumbers
            .sink { [weak self] numbers in
                self?.displayedNumbers = numbers
                print("Numbers greater than 15: \(numbers)")
            }
            .store(in: &cancellables)
    }
}




//class ViewController: UIViewController {
//    
//    var nums = DefaultNumberDataProvider()
//    var viewModel = ViewModel
//    
////    var testCalc = ViewModel(dataProvider: numbers.getNumbers() )
//    
//    // Default initializer
//        init(viewModel: ViewModel = ViewModel(dataProvider: DefaultNumberDataProvider())) {
//            self.viewModel = viewModel
//            super.init(nibName: nil, bundle: nil)
//        }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        view.backgroundColor = .systemBlue
//        
//        
//        // Use the viewModel to get numbers greater than 15
//                let filteredNumbers = viewModel.numbersGreaterThanFifteen()
//        
//        
////        let resultNumber = testCalc.numbersGreaterThanFifteen(from: testCalc.numbers)
////        print("Result: \(resultNumber)")
////        
////        let resultNames = testCalc.stringsStartingWithC(from: testCalc.listNames)
////        print("Result: \(resultNames)")
//    }
//
//
//}

//struct listNumbers {
//    
////    var numbers = [11, 3, 35, 7, 9, 1, 13, 25, 17, 19]
//    
//    func getNumbers() -> [Int] {
//        
//        var numbers = [11, 3, 35, 7, 9, 1, 13, 25, 17, 19]
//        
//    }
//    
//}
