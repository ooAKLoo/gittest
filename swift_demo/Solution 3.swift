//
//  Solution 3.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/17.
//


class Solution_countPairs {
    func countPairs(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        let len = nums.count
        
        for i in 0..<len{
            for j in i+1..<len{
                if nums[i]==nums[j] && (i*j)/k == 0{
//                    res+=1
                }
            }
        }
        return res
    }
}
