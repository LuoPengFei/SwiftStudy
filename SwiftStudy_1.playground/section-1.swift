// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 定义一个变量
var friendly = "hello"
friendly = "您好"

// 定义一个常量，一旦确定不可更改
let friendName = "1234"

// 输出常量和变量
println(friendly)

println(friendName)

println("This is a test")

let minValue = UInt8.min

let maxValue = UInt8.max

let a = 13

let b = 3.1234

let c = false

if c {
    println("真")
}
else
{
    println("假")
}


let names = ["Anna","Alex","Brian","Jack"]
let count = names.count
for i in 1...count
{
    println("第\(i)个人叫\(names[i - 1])")
}

var emptyStr = String()

if emptyStr.isEmpty
{
    println("emptyStr 是空的")
}

for character in "Dogs"
{
    println(character)
}


let string1 = "hello"
let string2 = " there"
let character1: Character = "!"
let character2: Character = "?"
let stringPlusCharacter = string1 + string2

var testArray = ["eggs","Milk"]

println(testArray.count)

testArray += ["spread","butter"]

testArray .removeAtIndex(2)

testArray.insert("123", atIndex: 0)

testArray.append("234")





