//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 冒泡排序
/*
 与上面讲的交换排序类似的是，冒泡排序也是用两层的循环来实现的；但与其不同的是：
 循环的边界条件：冒泡排序的外层是[0,array.count-1);内层是[0,array.count-1-i)。可以看到内层的范围是不断缩小的，而且范围的前端不变，后端在向前移。
 交换排序比较的是内外层索引的元素（array[i] 和 array[j]）,但是冒泡排序比较的是两个相邻的内层索引的元素：array[j]和array[j+1]。

 */
func bubbleSort(_ array: inout [Int]) -> [Int] {
    
    guard array.count > 1 else {
        return array
    }
    
    for i in 0..<array.count {
        var swaped: Bool = false
        
        for j in 0..<array.count-i-1 {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
                swaped = true
                
            }
            
        }
        if !swaped {
            break
        }
    }
    
    return array
    
}


var originA = [34,2,12,6,34,8,66,23]

print("冒泡排序：\(bubbleSort(&originA))")


// 选择排序
/*
 外层循环的边界是[0,array.count-1)，index为i。
 内层循环的边界是[i+1,array.count)，index为j。可以看到内层的范围也是不断缩小的，而且范围的前端一直后移，后端保持不变。
 具体做法是：
 
 在外层循环的开始，将i作为最小值index（很可能不是该数组的最小值）。
 在内层循环里面找到当前内层循环范围内的最小值，并与已经记录的最小值作比较：
 如果与当前记录的最小值index不同，则替换
 如果与当前记录的最小值index相同，则不替换
 */

func selectionSort(_ array: inout [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    for i in 0 ..< array.count-1 {
        
        var min = i
        for j in i+1 ..< array.count {
            if array[j] < array[min] {
                min = j
            }
        }

        if i != min {
            array.swapAt(i, min)
        }
    }
    
    return array
}

print("选择排序：\(selectionSort(&originA))")

// 插入排序
/*
 插入排序的基本思想是：从数组中拿出一个元素（通常就是第一个元素）以后，再从数组中按顺序拿出其他元素。如果拿出来的这个元素比这个元素小，就放在这个元素左侧；反之，则放在右侧。整体上看来有点和玩儿扑克牌的时候将刚拿好的牌来做排序差不多。
 
 选择排序也是两层循环：
 
 外层循环的边界是[1,array.count)，index为i。
 内层循环开始的时候初始index j = i，然后使用一个while循环，循环条件是j>0 && array[j] < array[j - 1],循环内侧是交换j-1和j的元素，并使得j-1。可以简单理解为如果当前的元素比前一个元素小，则调换位置；反之进行下一个外层循环。

 */
func insertSort(_ array: inout [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    for i in 1 ..< array.count {
        var j = i
        while j > 0 && array[j] < array[j-1] {
            array.swapAt(j-1, j)
            j -= 1
        }
        
    }
    
    return array
}

print("插入排序：\(insertSort(&originA))")

// 归并排序
/*
 
 */

func _merge(left: [Int], right: [Int]) -> [Int] {
    var leftIndex: Int = 0
    var rightIndex: Int = 0
    
    var sortC: [Int] = [Int]()
    
    while leftIndex < left.count && rightIndex < right.count {
        
        if left[leftIndex] < right[rightIndex] {
            
            sortC.append(left[leftIndex])
            leftIndex += 1
        } else if right[rightIndex] < left[leftIndex] {
            
            sortC.append(right[rightIndex])
            rightIndex += 1
        } else {
            
            sortC.append(left[leftIndex])
            leftIndex += 1
            
            sortC.append(right[rightIndex])
            rightIndex += 1
        }
    }
        
    while leftIndex < left.count {
        sortC.append(left[leftIndex])
        
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        sortC.append(right[rightIndex])
        rightIndex += 1
    }
    
    return sortC

}

//let a: [Int] = [2,43,23,1,3,67]
//let b: [Int] = [33,21,5,8,90,3,22]
//
//print("归并排序：\(_merge(left: a, right: b))")

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    let middleIndex = array.count / 2
    let left = mergeSort(Array(array[0..<middleIndex]))
    let right = mergeSort(Array(array[middleIndex ..< array.count]))
    
    return _merge(left: left, right: right)
    
    
}


print("归并排序：\(originA)")

// 快速排序
//func quickSort0(_ array: [Int]) -> [Int] {
//    guard array.count > 1 else {
//        return array
//    }
//
//    let pivot = array[array.count/2]
//
//    let less = array.filter { $0 < pivot }
//    let greater = array.filter { $0 > pivot }
//
//
//    return quickSort0(less) + quickSort0(greater)
//}
//
//print("快速排序1：\(quickSort0(originA))")


func _partition(_ array: inout [Int], low: Int, high: Int) -> Int {

    var low = low
    var high = high

    let pivotValue = array[low]

    while low < high {
        while low < high && array[high] >= pivotValue {
            high -= 1
        }
        array[low] = array[high]

        while low < high && array[low] <= pivotValue {
            low += 1
        }
        array[high] = array[low]
    }

    array[low] = pivotValue
    return low
}

func quickSort1(_ array: inout [Int], low: Int, high: Int) -> [Int] {
    guard array.count > 1 else {
        return array
    }

    if low < high {
        let pivotIndex = _partition(&array, low: low, high: high)
        quickSort1(&array, low: low, high: pivotIndex-1)
        quickSort1(&array, low: pivotIndex+1, high: high)

    }
    
    return array

}



print("快速排序2：\(quickSort1(&originA, low: 0, high: originA.count-1))")

func _swap(_ arr: inout [Int], _ le: Int, _ ri: Int) {
    let temp = arr[le]
    arr[le] = arr[ri]
    arr[ri] = temp
}
func quickSort2(_ array: inout [Int], _ left: Int, _ right: Int) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    var l = left
    var r = right
    
    if l < r {
        while l < r {
            while array[r] >= array[left] && l < r {
                r -= 1
            }
            while array[l] < array[left] && l < r {
                l += 1
            }
            if l < r {
                _swap(&array, l, r)
            }
            
        }
        _swap(&array, left, l)
        quickSort2(&array, left, l)
        quickSort2(&array, l+1, right)
    }
    
    return array
    
}

print("快速排序3：\(quickSort2(&originA, 0, originA.count-1))")

////翻转指定范围的字符
//func _reverseStr( _ chars:inout [Character], _ startIndex:Int, _ endIndex:Int){
//
//    var startIndex = startIndex
//    var endIndex = endIndex
//
//    if startIndex <= endIndex {
//
//        let tempChar = chars[endIndex]
//        chars[endIndex] = chars[startIndex]
//        chars[startIndex] = tempChar
//
//        startIndex += 1
//        endIndex -= 1
//
//        _reverseStr(&chars,startIndex,endIndex)
//
//    }
//
//}
//
////逐字翻转字符串
//func reverseWords(_ str:String) -> String{
//
//    var chars = [Character](str.characters)
//
//    //首先翻转整个字符串所有字符,"the sky is blue" -> "eulb si yks eht"
//    _reverseStr(&chars,0,chars.count-1)
//
//    //然后翻转每个单词中的字符，"eulb si yks eht" -> "blue is sky the"
//    var startIndex = 0
//    for endIndex in 0 ..< chars.count {
//        if endIndex == chars.count - 1 || chars[endIndex + 1] == " " {
//            _reverseStr(&chars, startIndex, endIndex)
//            startIndex = endIndex + 2
//        }
//    }
//
//    return String(chars)
//}
//
//reverseWords("the sky is blue") //return "blue is sky the"

func reversChars(_ ch: String) -> String {
    var tem: [Character] = [Character]()
    var result: [String] = [String]()
    var index = 0
    
    for i in ch {
        if i != " " {
            tem.append(i)
        } else {
            result.insert((String(tem) + " "), at: 0)
            tem.removeAll()
        }
        
        if index == ch.count-1 {
            result.insert((String(tem) + " "), at: 0)
        }
        index += 1
    }
    
    var str: String = String()
    for element in result {
        str += element
    }
    return str
}

print(reversChars("the sky is blue"))

// 查找第K大元素
func _searchA(_ array: inout [Int], left: Int, right: Int) -> Int {
    
    var l = left
    var r = right
    
    while l < r {
        while array[r] >= array[left] && l < r {
            r -= 1
        }
        
        while array[l] < array[left] && l < r {
            l += 1
        }
        
        if l < r {
            _swap(&array, l, r)
        }
        print("eeee")

    }
    _swap(&array, left, l)
    return l
}

func findIndex(_ array: inout [Int], index: Int) -> Int {
    print("wwww")

    guard index < array.count else {
        fatalError("索引错误")
    }
    
    var left = 0
    var right = array.count-1
    
    print("hhhh")
    
    while true {
        let l = _searchA(&array, left: left, right: right)
        print("l = \(l)")
        if l == index {
            return array[l]
        } else if (array[l] < array[index]) {
            left = l + 1
        } else if (array[l] > array[index]) {
            right = right - 1
        }
        
    }
    
    
}

let index = 3
print("第\(index)大数为:\(findIndex(&originA, index: index))")
