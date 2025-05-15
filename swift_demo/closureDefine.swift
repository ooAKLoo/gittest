//
//  closureDefine.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/4.
//

import Foundation


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
