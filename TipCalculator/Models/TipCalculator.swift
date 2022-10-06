//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by VIshnu Unnikrishnan  on 27/09/22.
//

import Foundation

enum TipCalculatorError: Error {
    case invalidInput
}
class TipCalculator {
    
    func calculate(total:Double, tipPercentage: Double ) throws -> Double {
        if total < 0 {
            throw TipCalculatorError.invalidInput
        }
        return total * tipPercentage
    }
    
}
