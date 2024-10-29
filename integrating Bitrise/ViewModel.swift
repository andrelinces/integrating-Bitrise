//
//  ViewModel.swift
//  integrating Bitrise
//
//  Created by Andre Linces on 10/24/24.
//

import Foundation
import Combine

final class ViewModel {
    
    
    @Published var filteredNumbers: [Int] = []
    @Published var filteredStrings: [String] = []
    
    private let numberProvider: NumberDataProvider
    private let stringProvider: StringDataProvider
    
    init(numberProvider: NumberDataProvider, stringProvider: StringDataProvider) {
        self.numberProvider = numberProvider
        self.stringProvider = stringProvider
        filterNumbers()
        filterStrings()
    }
    
    private func filterNumbers() {
        filteredNumbers = numberProvider.numbers.filter { $0 > 15 }
    }
    
    private func filterStrings() {
        filteredStrings = stringProvider.strings.filter { $0.hasPrefix("C") }
    }
    
    func stringsStartingWithC(from strings: [String]) -> [String] {
        return strings.filter { $0.hasPrefix("C") }
    }
    
}


//MARK: - PROTOCOL - NumberDataProvider


protocol NumberDataProvider {
    var numbers: [Int] { get }
}

class DefaultNumberDataProvider: NumberDataProvider {
    var numbers: [Int]
    
    init(numbers: [Int] = [11, 3, 35, 7, 9, 1, 13, 25, 17, 19]) {
        self.numbers = numbers
    }
}

protocol StringDataProvider {
    var strings: [String] { get }
}

class DefaultStringDataProvider: StringDataProvider {
    var strings: [String]
    
    init(strings: [String] = ["Logan", "Slater", "Katie", "Conan", "Carol"]) {
        self.strings = strings
    }
}
