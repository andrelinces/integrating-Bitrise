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
