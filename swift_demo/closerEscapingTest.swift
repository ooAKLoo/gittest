//
//  Test.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/11.
//


class Test {
    var value = 0
    
    // 非逃逸闭包
    func runNonEscaping(_ closure: () -> Void) {
        closure()
        print("非逃逸函数结束，value = \(value)")
    }
    
    // 逃逸闭包
    var storedClosure: (() -> Void)?
    func runEscaping(_ closure: @escaping () -> Void) {
        storedClosure = closure // 保存闭包
        print("逃逸函数结束，value = \(value)")
    }
}

let test = Test()


func closerEscapingTest() {
    let test = Test()
    
    // 测试非逃逸闭包
    test.runNonEscaping {
        test.value = 10
    }
    
    // 测试逃逸闭包
    test.runEscaping {
        test.value = 20
    }
    
    test.storedClosure?()
    print("调用逃逸闭包后，value = \(test.value)")
}
