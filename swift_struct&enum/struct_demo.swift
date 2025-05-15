//
//  struct_demo.swift
//  swift_struct&enum
//
//  Created by 杨东举 on 2025/5/11.
//

import Foundation

class StructDemo{
    struct User: Codable {
        var name: String
        var age: Int
    }
   
    func test(){
        // 编码
        let user = User(name: "张三", age: 30)
        let encoder = JSONEncoder()
        let encoderData = try? encoder.encode(user)
        print("编码 data",encoderData)
        // 解码
        let decoder = JSONDecoder()
        let decodedUser = try? decoder.decode(User.self, from: encoderData!)
        print("解码 decodedUser",decodedUser)
    }
}
