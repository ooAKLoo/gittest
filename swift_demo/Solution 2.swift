//
//  Solution 2.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/14.
//


class Solution3 {
    func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
        var count = arr.count
        var res = 0
        for i in 0..<count{
            for j in (i+1)..<count{
                for k in (j+1)..<count{
                    if abs(arr[i]-arr[j]) <= a && abs(arr[j]-arr[k]) <= b && abs(arr[i]-arr[k]) <= c{
                        res += 1
                    }
                }
            }
        }
        
        return res
    }
}
