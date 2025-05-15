//
//  ClosureExample.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/4.
//

import Foundation

class ClosureExample {
    var escapingClosureReleased = false
    var nonEscapingClosureReleased = false
    
    // 逃逸闭包示例
    func fetchData(completion: @escaping (Data) -> Void) {
        print("1. fetchData 函数开始执行")
        
        DispatchQueue.global().async { [weak self] in
            Thread.sleep(forTimeInterval: 2)
            print("3. 异步任务执行中，此时 fetchData 函数已返回")
            
            let data = "这是异步获取的数据".data(using: .utf8)!
            completion(data)
            
            DispatchQueue.main.async {
                self?.escapingClosureReleased = true
                print("5. 逃逸闭包已执行完毕")
            }
        }
        
        print("2. fetchData 函数返回，但闭包尚未执行")
    }
    
    // 非逃逸闭包示例
    func processData(handler: (Data) -> Void) {
        print("1. processData 函数开始执行")
        
        let data = "这是同步处理的数据".data(using: .utf8)!
        handler(data)
        
        nonEscapingClosureReleased = true
        print("2. processData 函数返回，闭包已执行完毕")
    }
}

func demonstrateClosureLifecycles() {
    print("=== 闭包生命周期演示开始 ===")
    
    let example = ClosureExample()
    
    // 非逃逸闭包示例
    print("\n【非逃逸闭包】")
    example.processData { data in
        if let string = String(data: data, encoding: .utf8) {
            print("-> 非逃逸闭包执行: \"\(string)\"")
        }
    }
    print("-> 闭包已释放: \(example.nonEscapingClosureReleased)")
    
    // 逃逸闭包示例
    print("\n【逃逸闭包】")
    example.fetchData { data in
        if let string = String(data: data, encoding: .utf8) {
            print("4. 逃逸闭包执行: \"\(string)\"")
        }
    }
    print("-> 函数返回后，闭包是否释放: \(example.escapingClosureReleased)")
    
    print("\n等待异步操作...")
    Thread.sleep(forTimeInterval: 3)
    print("等待结束，闭包是否释放: \(example.escapingClosureReleased)")
    
    print("=== 闭包生命周期演示结束 ===")
}
