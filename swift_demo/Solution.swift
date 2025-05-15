//
//  Solution.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/7.
//


class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let xS=String(x)
        let characters = Array(xS)
        let len=xS.count

        var left=0
        var right=len-1

        while(left<right){
            if(characters[left] != characters[right]){
                return false
            }
            left+=1
            right-=1
        }
        return true
    }
}
