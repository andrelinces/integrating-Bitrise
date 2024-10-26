//
//  ViewModel.swift
//  integrating Bitrise
//
//  Created by Andre Linces on 10/24/24.
//

import Foundation
import Combine

final class ViewModel {
    
//     
    
//    var numbers = [1, 3, 5, 7, 9, 13, 5, 8]
    
//     var listNames = ["Jonh", "Conor", "Conan", "Logan", "Slater", "Linces", "Camilla" ]
    
    
    //testing...
    

        @Published var filteredNumbers: [Int] = []
        private let dataProvider: NumberDataProvider

        init(dataProvider: NumberDataProvider) {
            self.dataProvider = dataProvider
            filterNumbers()
        }

        private func filterNumbers() {
            filteredNumbers = dataProvider.numbers.filter { $0 > 15 }
        }
    
     
//    func numbersGreaterThanFifteen(from numbers: [Int]) -> [Int] {
//        return numbers.filter { $0 > 15 }
//    }
    
   
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

