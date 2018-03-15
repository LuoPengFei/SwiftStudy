//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 双向链表实现
// 节点
public class LinkedLidtNode<T> {
    var value: T
    
    weak var previous: LinkedLidtNode?
    weak var next: LinkedLidtNode?
    
    init(value: T) {
        self.value = value
    }
    
}

//
public class LinkedList<T> {
    public typealias Node = LinkedLidtNode<T>
    
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            count += 1
            node = next
        }
        return count
        
    }
    
    private var first: Node {
        return head!
    }
    
    private var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public func node(atIndex index: Int) -> Node? {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            guard index < count else {
                return nil
            }
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
    
    // 打印所有的节点
    public func printAllNodes() {
        guard var node = head else {
            return
        }
        for index in 0 ..< count {
            print("\(index) = \(node.value)")
            node = node.next!
        }
        
    }
    
    // 移除节点
    public func removeNode(node: Node) -> T? {
        guard let node = head else {
            return nil
        }
        
        let pre = node.previous
        let next = node.next
        if let pr = pre {
            pr.next = next
        } else {
            head = next
        }
        
       next?.previous = pre
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    // 找出中间节点
    public func findMidNode(list: LinkedList) -> Node? {
        var fast: Node?
        var slow: Node?
        slow = list.head
        fast = list.head
        
        while var tm = fast {
            if tm.next != nil {
                tm = (tm.next?.next)!
            } else {
                break
            }
            slow = slow?.next
        }
        return slow
        
    }
    
    // 反转链表
    public func reverse(list: LinkedList) {
        guard list.head != nil else {
            return
        }
        var h: Node = list.head!
        var p: Node = h.next!
        var q: Node = h
        
        while p.next != nil {
            q.next = p.next
            p.next = q
            h = p
            p = q.next!
        }
        head = h
    }
    
    
}



public struct Stack<T> {
    fileprivate var sA = [T]()
    
    public var count: Int {
        return sA.count
    }
    
    public var isEmpty: Bool {
        return sA.isEmpty
    }
    
    public var top: T? {
        if isEmpty {
            return nil
        } else {
            return sA.last
        }
    }
    
    public mutating func push(_ element: T) {
        sA.append(element)
    }
    
    public mutating func pop() -> T? {
        guard !isEmpty else {
            return nil
        }
        return sA.removeLast()
    }
    
    public mutating func printAllElements() {
        guard count > 0 else {
            return
        }
        for (index, element) in sA.enumerated() {
            print("\(index) = \(element)")
        }
    }
    
}


