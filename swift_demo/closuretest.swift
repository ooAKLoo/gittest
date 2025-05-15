//
//  closureDefine.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/4.
//

import Foundation

class ClosureTest{
    
//    let add = {$0 + $1}
//    let add: (Int,Int) -> Int = {(num1, num2) in
//        return num1 + num2
//    }
//    
//    print(add(3,4))
    
    func createCounter() -> () -> Void {
        var count = 0
        let increment: () -> Void = {
            count += 1
            print(count)
        }
        return increment
    }
    
    func printCounter(){
        let counter = createCounter()
        counter() // 打印 1
        counter() // 打印 2
        counter() // 打印 3
    }
}
