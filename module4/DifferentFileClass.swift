//
//  DifferentFileClass.swift
//  module4
//
//  Created by 杨东举 on 2025/4/12.
//

class DifferentFileClass {
    func accessProperties() {
        let instance = PublicClass()
        
//        print("\n在同一模块(MyApp)的不同文件(OtherFile.swift)中访问:")
        print("- publicProperty: \(instance.publicProperty)") // ✅ 可访问
        print("- internalProperty: \(instance.internalProperty)") // ✅ 可访问
//         print("- filePrivateProperty: \(instance.filePrivateProperty)") // ❌ 编译错误，无法访问
        // print("- privateProperty: \(instance.privateProperty)") // ❌ 编译错误，无法访问
        
        // 测试修改属性
        instance.publicProperty = 13
        instance.internalProperty = 23
        // instance.onlyGetFromOutside = 3 // ❌ 编译错误，无法设置
        
        print("读取onlyGetFromOutside: \(instance.onlyGetFromOutside)") // ✅ 可以读取
    }
}

func testInDifferentFile() {
    let differentFileInstance = DifferentFileClass()
    differentFileInstance.accessProperties()
}
