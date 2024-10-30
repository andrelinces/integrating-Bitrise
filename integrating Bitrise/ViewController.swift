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
    
//    private var numberModel: NumberDataProvider
//    private var stringModel: StringDataProvider
    
    @Published var displayedNumbers: [Int] = [] // New published property
    @Published var displayedStrings: [String] = []
    private var cancellables = Set<AnyCancellable>()

    
    //testing....
    
    init(viewModel: ViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
            bindViewModel()
        }
    
    // Required initializer for Storyboards
        required init?(coder: NSCoder) {
            let defaultNumberProvider = DefaultNumberDataProvider()
            let defaultStringProvider = DefaultStringDataProvider()
            self.viewModel = ViewModel(numberProvider: defaultNumberProvider, stringProvider: defaultStringProvider)
            super.init(coder: coder)
        }
    
    
    
    //testing......
    
//    init(viewModel: ViewModel = ViewModel(dataProvider: DefaultNumberDataProvider())) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }

//    required init?(coder: NSCoder) {
//        let defaultDataProvider = DefaultNumberDataProvider()
//        self.viewModel = ViewModel(dataProvider: defaultDataProvider)
//        super.init(coder: coder)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
//        viewModel.$filteredNumbers
//            .sink { [weak self] numbers in
//                self?.displayedNumbers = numbers
//                print("Numbers greater than 15: \(numbers)")
//            }
//            .store(in: &cancellables)
//        viewModel.$filteredStrings
//                    .sink { [weak self] string in
//                        self?.displayedStrings = string
//                        print("String equal C: \(string)")
//                    }.store(in: &cancellables)
    }
    
    private func bindViewModel() {
            // Observing filteredNumbers and filteredStrings from viewModel
            viewModel.$filteredNumbers
                .assign(to: &$displayedNumbers)
        print("Numbers: - \(displayedNumbers)")
            viewModel.$filteredStrings
                .assign(to: &$displayedStrings)
        print("Strings: - \(displayedStrings)")
        }
    
    
//    private func bindViewModel() {
//        
//        viewModel.$filteredNumbers
//            .sink { [weak self] numbers in
//                self?.displayedNumbers = numbers
//                print("Numbers greater than 15: \(numbers)")
//            }.store(in: &cancellables)
//        viewModel.$filteredStrings
//            .sink { [weak self] string in
//                self?.displayedStrings = string
//                print("Numbers greater than 15: \(string)")
//            }.store(in: &cancellables)
//    }
}
