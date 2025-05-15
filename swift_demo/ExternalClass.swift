//
//  ExternalClass.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/12.
//

import module4 // 导入MyApp模块

class ExternalClass {
    func accessProperties() {
        let instance = PublicClass() // 必须是public类才能在外部模块访问
        
        print("\n在不同模块(ExternalApp)中访问:")
//        print("- publicProperty: \(instance.publicProperty)") // ✅ 可访问
//         print("- internalProperty: \(instance.internalProperty)") // ❌ 编译错误，无法访问
        // print("- filePrivateProperty: \(instance.filePrivateProperty)") // ❌ 编译错误，无法访问
        // print("- privateProperty: \(instance.privateProperty)") // ❌ 编译错误，无法访问
        
        // 测试修改属性
        instance.publicProperty = 14
        // instance.internalProperty = 24 // ❌ 编译错误，无法访问
        // instance.onlyGetFromOutside = 4 // ❌ 编译错误，无法设置
        
        print("读取onlyGetFromOutside: \(instance.onlyGetFromOutside)") // ✅ 可以读取
    }
}

func testInExternalModule() {
    let externalInstance = ExternalClass()
    externalInstance.accessProperties()
}
