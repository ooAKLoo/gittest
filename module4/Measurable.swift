//
//  Measurable.swift
//  module4
//
//  Created by 杨东举 on 2025/4/12.
//

import Foundation

public protocol Measurable {
    var size: Int { get }
}


public class Ball: Measurable{
    public var size: Int
    
    public init(size: Int){
        self.size = size
    }
}
