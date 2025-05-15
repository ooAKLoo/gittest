//
//  Measurable.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/12.
//


protocol Measurable {
    var _size: Int { get set } // 要求可读写
}

class Ball: Measurable {
    var _size: Int
//     var _size: Int
    
//    var size: Int { // 只实现了 get
//        return _size
//    }
    
    init(size: Int) {
        self._size = size
    }
}
