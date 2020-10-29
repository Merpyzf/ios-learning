import Foundation

// 初始化空字符串
var emptyString = "" // 空字符串字面量
var anotherEmptyString = String() // 初始化 String 实例

// 判断字符串是否为空 (通过 isEmpty 属性)
if emptyString.isEmpty{
    print("什么都没有")
}

// 字符串可变性
var variableString = "Horse"
variableString += "and carriage"
let constantString = "Highlander"
//constantString += "and another Highlander"
// 这会报告一个编译错误, 常量不可以被修改

//Swift 的 string 类型是值类型。如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作或在函数方法中传递时，会进行值拷贝。在任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操作。


// 遍历字符串中的字符
//Swift 的 string 类型表示特定序列的 Character 类型值的集合。每一个字符代表一个Unicode字符。可以通过 for-in 循环进行遍历
for c in "Dog🐶"{
    print(c)
}
