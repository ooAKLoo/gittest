//
//  TreeNode.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/15.
//


//Definition for a binary tree node.
 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
    public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
        self.right = right
     }
}
 
class Solution_bst {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        func dfs(l:Int,r:Int) -> TreeNode?{
            if l>r {
                return nil
            }
            let mid = (l+r) // 2
            var root = TreeNode(nums[mid])
            root.left = dfs(l: l,r: mid-1)
//            root.right = dfs(l: mid+1,r: r)
            return root
        }
        return dfs(l: 0, r: nums.count-1)
    }
}
