//
//  enum_demo.swift
//  swift_struct&enum
//
//  Created by 杨东举 on 2025/5/11.
//

import Foundation

// MARK: 不带原始值的枚举
enum Season {
    case spring
    case summer
    case autumn
    case winter
}

// 另一种声明方式
enum Season2 {
    case spring, summer, autumn, winter
}

// MARK: 带字符串原始值的枚举
enum Direction: String {
    case north = "北"
    case south = "南"
    case east = "东"
    case west = "西"
}


class TestEnum {
    func testSeasonEnum(season: Season) {
        
        switch season {
        case .spring:
            print("春天")
        case .summer:
            print("夏天")
        case .autumn:
            print("秋天")
        case .winter:
            print("冬天")
        }
    }
    
    func testDirectionEnum(direction: Direction) {
        
        switch direction {
        case .north:
            print("向北走 - \(direction.rawValue)")
        case .south:
            print("向南走 - \(direction.rawValue)")
        case .east:
            print("向东走 - \(direction.rawValue)")
        case .west:
            print("向西走 - \(direction.rawValue)")
        }
    }
    
    func testDirectionRawValue(direction: Direction) {
        // 这里我们switch的是rawValue（String类型）而不是枚举值
        switch direction.rawValue {
        case "北":
            print("向北走")
        case "南":
            print("向南走")
        case "东":
            print("向东走")
        case "西":
            print("向西走")
        default:
            // 必须有default分支，因为Swift无法确保String类型的所有可能值都被处理
            print("未知方向")
        }
    }
    
    func testAll() {
        testSeasonEnum(season: .summer)
//        testDirectionEnum(direction: .north)
    }
}
