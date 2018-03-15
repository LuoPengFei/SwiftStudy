//: Playground - noun: a place where people can play

import UIKit

var str = "二叉树 demo"

public class TreeNode {
    public var val: Int
    public var leftNode: TreeNode?
    public var rightNode: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
    }
}

// 计算树的最大深度
func maxDepth(root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    return max(maxDepth(root: root.leftNode), maxDepth(root: root.rightNode)) + 1
}

// 判断一颗二叉树是否为二叉树查找
public func _help(node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
    guard let node = node else {
        return false
    }
    
    if let min = min, node.val < min {
        return false
    }
    
    if let max = max, node.val > max {
        return false
    }
    return _help(node: node.leftNode, min, node.val) && _help(node: node.rightNode, min, node.val)
}

public func isValiteBST(root: TreeNode?) -> Bool {
    return _help(node: root, nil, nil)
}

// 反转二叉树
func reverBinaryTree(root: TreeNode?) {
    guard let root = root else {
        return
    }
    
    let tempT = root.leftNode
    root.leftNode = root.rightNode
    root.rightNode = tempT
    if let left = root.leftNode {
        reverBinaryTree(root: left)
    }
    
    if let right = root.rightNode {
        reverBinaryTree(root: right)
    }
}


// 遍历二叉树
// 前续遍历
public func preorderTrversal(root: TreeNode?) -> [Int] {
    var res: [Int] = [Int]()
    var stack = [TreeNode]()
    var node = root
    
    while !stack.isEmpty || node != nil {
        if node != nil {
            res.append((node?.val)!)
            stack.append(node!)
            node = node?.leftNode
        } else {
            node = stack.removeLast().rightNode
        }
    }
    
    return res
    
    
}
