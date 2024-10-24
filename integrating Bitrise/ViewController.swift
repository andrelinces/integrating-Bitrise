//
//  ViewController.swift
//  integrating Bitrise
//
//  Created by Andre Linces on 10/23/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  var testCalc = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        
        let resultNumber = testCalc.numbersGreaterThanFifteen(from: testCalc.numbers)
        print("Result: \(resultNumber)")
        
        let resultNames = testCalc.stringsStartingWithC(from: testCalc.listNames)
        print("Result: \(resultNames)")
    }


}

