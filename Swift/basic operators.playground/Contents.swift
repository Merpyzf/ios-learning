import Foundation

// ?? 合并空值运算符
var a: Int? = nil
var nonnull = a ?? 0
print(nonnull)

// ! 对 Optinal 的变量进行解包
// 1. 声明时添加！，告诉编译器这个变量时Optional的，并且之后对该变量操作的时候，都隐式的在操作前添加！
// 2. 在对变量操作前添加！，认为变量是非nill的，可直接进行解包处理
var value1 = a != nil ? a! : 0
