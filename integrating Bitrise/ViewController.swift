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
    private var cancellables = Set<AnyCancellable>()
    
    @Published var displayedNumbers: [Int] = [] // New published property
    @Published var displayedStrings: [String] = []
    
    init(viewModel: ViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
            bindViewModel()
        }
    
    // Required initializer for Storyboardsor maintain support.
        required init?(coder: NSCoder) {
            let defaultNumberProvider = DefaultNumberDataProvider()
            let defaultStringProvider = DefaultStringDataProvider()
            self.viewModel = ViewModel(numberProvider: defaultNumberProvider, stringProvider: defaultStringProvider)
            super.init(coder: coder)
        }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()

    }
   
    private func bindViewModel() { /// Function to receive values ​​from search lists of numbers and strings.
        viewModel.$filteredNumbers
            .sink { [weak self] numbers in
                self?.displayedNumbers = numbers
                print("Numbers greater than 15: \(numbers)")
            }.store(in: &cancellables)
        viewModel.$filteredStrings
            .sink { [weak self] string in
                self?.displayedStrings = string
                print("Strings equal to C: \(string)")
            }.store(in: &cancellables)
    }
}

// Checking about the differences between MVVM-C vs MVVM-R.
// Refactor code.

