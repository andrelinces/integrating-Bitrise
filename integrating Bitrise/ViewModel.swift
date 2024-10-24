//
//  ViewModel.swift
//  integrating Bitrise
//
//  Created by Andre Linces on 10/24/24.
//

import Foundation

final class ViewModel {
    
     var numbers = [11, 3, 35, 7, 9, 1, 13, 25, 17, 19]
    
     var listNames = ["Jonh", "Conor", "Conan", "Logan", "Slater", "Linces", "Camilla" ]
   
    
    func numbersGreaterThanFifteen(from numbers: [Int]) -> [Int] {
        return numbers.filter { $0 > 15 }
    }
    
    func stringsStartingWithC(from strings: [String]) -> [String] {
        return strings.filter { $0.hasPrefix("C") }
    }
    
}
