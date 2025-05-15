//
//  StatisticsHandler.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/11.
//


import Foundation

// 1. 定义一个统计数据处理器协议
protocol StatisticsHandler {
    func handleEventData(_ data: [String: Any])
}

// 2. 不同类型的统计处理器
class FirmwareStatisticsHandler: StatisticsHandler {
    func handleEventData(_ data: [String: Any]) {
        guard let eventId = data["eventId"] as? String, 
              eventId.hasPrefix("fw_") else {
            print("无效的固件事件ID")
            return
        }
        
        // 处理固件数据（例如MD5处理敏感信息）
        var processedData = data
        if let modelNum = data["model_num"] as? String {
            processedData["model_num"] = "md5_\(modelNum)"
        }
        
        print("固件统计处理: \(processedData)")
    }
}

class BatteryStatisticsHandler: StatisticsHandler {
    func handleEventData(_ data: [String: Any]) {
        guard let eventId = data["eventId"] as? String, 
              eventId.hasPrefix("bat_") else {
            print("无效的电池事件ID")
            return
        }
        
        print("电池统计处理: \(data)")
    }
}

// 3. 统计管理器 - 负责动态分发统计数据
class StatisticsManager {
    // 注册的处理器映射表
    private var handlers: [String: StatisticsHandler] = [:]
    
    // 注册处理器
    func registerHandler(_ prefix: String, handler: StatisticsHandler) {
        handlers[prefix] = handler
    }
    
    // 定义一个表示方法调用的闭包类型（类似于NSInvocation）
    typealias Invocation = () -> Void
    
    // 创建一个方法调用（类似于创建NSInvocation）
    func createInvocation(forEventData data: [String: Any]) -> Invocation? {
        guard let eventId = data["eventId"] as? String else {
            print("事件ID缺失")
            return nil
        }
        
        // 根据事件ID前缀确定处理器
        let prefix = String(eventId.prefix(3))
        guard let handler = handlers[prefix] else {
            print("找不到事件前缀[\(prefix)]的处理器")
            return nil
        }
        
        // 创建一个闭包来封装方法调用（类似NSInvocation）
        let invocation: Invocation = {
            handler.handleEventData(data)
        }
        
        return invocation
    }
    
    // 立即执行方法调用（类似invoke）
    func processEventData(_ data: [String: Any]) {
        if let invocation = createInvocation(forEventData: data) {
            // 执行调用（这就是"invoke"）
            invocation()
        }
    }
    
    // 延迟执行方法调用的示例
    func scheduleProcessing(forEventData data: [String: Any], afterDelay seconds: TimeInterval) {
        if let invocation = createInvocation(forEventData: data) {
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                // 延迟执行调用
                invocation()
            }
        }
    }
}

// 4. 使用示例
func demoInvocation() {
    // 创建管理器和处理器
    let manager = StatisticsManager()
    
    // 注册不同类型的处理器
    manager.registerHandler("fw_", handler: FirmwareStatisticsHandler())
    manager.registerHandler("bat", handler: BatteryStatisticsHandler())
    
    // 固件统计数据
    let firmwareData: [String: Any] = [
        "eventId": "fw_update_start",
        "model_num": "ABC123",
        "firmware_version": "v1.2.3"
    ]
    
    // 电池统计数据
    let batteryData: [String: Any] = [
        "eventId": "bat_level_low",
        "battery_level": 15,
        "voltage": 3.7
    ]
    
    print("======= 立即处理 =======")
    // 直接处理（立即invoke）
    manager.processEventData(firmwareData)
    manager.processEventData(batteryData)
    
    print("\n======= 延迟处理 =======")
    // 延迟处理（存储invocation后延迟执行）
    manager.scheduleProcessing(forEventData: firmwareData, afterDelay: 1.0)
    // 在实际应用中，这里会继续运行其他代码，直到延迟时间到达
    
    // 为了演示，我们使用RunLoop等待一下
    print("等待延迟调用执行...")
    RunLoop.current.run(until: Date(timeIntervalSinceNow: 1.5))
}

