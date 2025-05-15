//
//  PublicClass.swift
//  module4
//
//  Created by 杨东举 on 2025/4/12.
//

public class PublicClass {
    public var publicProperty = 10 // 可被任何模块访问
    internal var internalProperty = 20 // 模块内部访问(默认)
    fileprivate var filePrivateProperty = 30 // 当前文件内可访问
    private var privateProperty = 40 // 只在类内部可访问
    
    // 计算属性可以有不同访问级别的getter和setter
    private(set) public var onlyGetFromOutside = 0 // 公开读取但私有设置
    
    // 添加public初始化器
    // 如果没有显式定义初始化器，Swift自动会生成了一个internal级别的初始化器
    // 等同于: internal init() { }
    public init() {
        // 初始化代码
    }
    
    // 用于测试访问级别的方法
    public func accessPropertiesInternally() {
        print("在PublicClass内部访问:")
        print("- publicProperty: \(publicProperty)") // ✅ 可访问
        print("- internalProperty: \(internalProperty)") // ✅ 可访问
        print("- filePrivateProperty: \(filePrivateProperty)") // ✅ 可访问
        print("- privateProperty: \(privateProperty)") // ✅ 可访问
        
        // 测试setter
        publicProperty = 11
        internalProperty = 21
        filePrivateProperty = 31
        privateProperty = 41
        onlyGetFromOutside = 1 // ✅ 在类内部可以设置
        
        print("设置后的onlyGetFromOutside: \(onlyGetFromOutside)")
    }
}

// 同一文件中的其他类
class SameFileClass {
    func accessProperties() {
        let instance = PublicClass()
        
        print("\n在同一文件(AccessControlDemo.swift)的不同类中访问:")
        print("- publicProperty: \(instance.publicProperty)") // ✅ 可访问
        print("- internalProperty: \(instance.internalProperty)") // ✅ 可访问
        print("- filePrivateProperty: \(instance.filePrivateProperty)") // ✅ 可访问
        // print("- privateProperty: \(instance.privateProperty)") // ❌ 编译错误，无法访问
        
        // 测试修改属性
        instance.publicProperty = 12
        instance.internalProperty = 22
        instance.filePrivateProperty = 32
        // instance.onlyGetFromOutside = 2 // ❌ 编译错误，无法设置
        
        print("读取onlyGetFromOutside: \(instance.onlyGetFromOutside)") // ✅ 可以读取
    }
}

// 执行测试
func runAccessControlDemo() {
    let publicInstance = PublicClass()
    let sameFileInstance = SameFileClass()
    
    publicInstance.accessPropertiesInternally()
    sameFileInstance.accessProperties()
}
