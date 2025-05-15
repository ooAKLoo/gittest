//
//  Customer.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/12.
//


class Customer {
    let name: String
    // 信用卡必然有所有者，用unowned
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("\(name)被释放") }
}

class CreditCard {
    let number: String
    // 无主引用 - 假设信用卡一定有持有者
    unowned let customer: Customer
    
    init(number: String, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit { print("信用卡\(number)被释放") }
}
