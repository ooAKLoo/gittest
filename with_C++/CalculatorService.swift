//
//  CalculatorService.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/15.
//


import Foundation

class CalculatorService {
    private let calculator = CalculatorWrapper()
    
    func add(_ a: Double, _ b: Double) -> Double {
        return calculator.addNumber(a, withNumber: b)
    }
    
    func subtract(_ a: Double, _ b: Double) -> Double {
        return calculator.subtractNumber(a, withNumber: b)
    }
}

// 使用示例
func testCalculator() {
    let calcService = CalculatorService()
    
    let sum = calcService.add(10.5, 20.3)
    print("10.5 + 20.3 = \(sum)")
    
    let difference = calcService.subtract(50.0, 25.5)
    print("50.0 - 25.5 = \(difference)")
}
