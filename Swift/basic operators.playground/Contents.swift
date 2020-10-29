import Foundation

// - ?? 空合运算符（Nill Coalescing operator）
var a: Int? = 10
print(a!+1)
// 当类型后面有 ? 号修饰时代表这个变量是一个 Optional 类型，被该类型的变量修饰在使用前需要先进行解包。
//var b = a + 1 变异出错 must unwrapper

// 使用 ?? (a ?? b)空合运算符的两个条件：
// 1. 表达式 a 必须是 Optional 类型
// 2. 默认值 b 的类型必须要和 a 存储值的类型保持一致

// 空合并运算符是对以下代码的简短表示方法

//a != nil ? a! : b

// - (a...b) 闭区间运算符
// 闭区间运算符 (a...b) 定义一个包含从 a 到 b （包括 a 和 b ）的所有值的区间，b 必须大于 a。
for index in 1 ... 5 {
    print("index: \(index)")
}

// - (a..<b) 半开区间运算符 定义一个从 a 到 b 但不包括 b 的区间。 半开区间主要用于遍历一个下标从 0 开始的列表。
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第\(i+1)个人叫\(names[i])")
}
