import Foundation

// 两种最常用的元组定义方式
var a = (1, 3.14, "hello, swift!", true)
var b: (Int, String) = (10, "hello, swift!")
print(a)
print(b)
// 取值
print(a.0)
// 修改
a.0 = 2
print(a.0)
// 赋值(元组是值类型)
var c = a // a.0 = 2
a.0 = 3
print(a)
print(c)
// let 修饰的元组的元素内容不允许修改
//let d = (1, 2, 3)
//d.0 = 2 Cannot assign to property: 'd' is a 'let' constant

// 创建元组时可以为内部的元素指定名称，后面可以通过名称取值
let e = (name: "wangke", age: 18)
print("name: \(e.name) age: \(e.age)")
let f: (name: String, age: Int) = ("wangke", 18)
print("name: \(f.name) age: \(f.age)")

// 元组的解包
let (name1, name2) = ("swift", "kotlin")
print(name1, name2)

// 解包时对元组内的元素进行忽略
let (kotlin, _, java) = ("kotlin", "java", "android")
print(kotlin, java)
