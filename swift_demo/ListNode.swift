//
//  ListNode.swift
//  swift_demo
//
//  Created by 杨东举 on 2025/4/14.
//



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution2 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy:ListNode = ListNode(-1)
        var p=dummy
        
        var l1 = list1
        var l2 = list2
        while(l1 != nil && l2 != nil){
            if let val1 = l1?.val, let val2 = l2?.val, val1 < val2{
                p.next = l1
                l1 = l1?.next
            } else {
                p.next = l2
                l2 = l2?.next
            }
            p=p.next!
        }
        
        p.next = l1 ?? l2
        
        return dummy.next
        
    }
}
