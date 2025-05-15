//
//  main.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/4.
//

import Foundation
import module4

//demonstrateClosureLifecycles()
//
//printCounter()

//demoInvocation()

//closerEscapingTest()

//var customer: Customer? = Customer(name: "李四")
//customer!.card = CreditCard(number: "1234-5678", customer: customer!)
//customer = nil // 两个对象都会被释放
//
//
//struct User {
//    var name: String
//    var email: String
//}
//var user = User(name: "  张三  ", email: "  zhang@example.com  ")
//print("用户名: '\(user.name)'") // 输出: '张三'
//print("邮箱: '\(user.email)'")  // 输出: 'zhang@example.com'
//
//testInExternalModule()
//
//
//
//var ball = Ball(size: 100)
//
//ball.size=200
//
//print(ball.size)


//let names = ["Tim", "Bob", "Anna", "Zack"]
////let sortedNames = names.sorted(by: { $0 < $1 })  // $0是第一个名字，$1是第二个名字
//let sortedNames = names.sorted {
//    print("第一个元素:", $0)
//    print("第二个元素:", $1)
//    return $0 < $1
//}

print(Solution_countPairs().countPairs([3,1,2,2,2,1,3], 2))
