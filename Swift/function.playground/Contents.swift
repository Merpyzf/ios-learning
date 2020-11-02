import Cocoa

// 🎯函数
func greet(person: String) -> String{
    let greeting = "Hello, \(person)!"
    return greeting
}
print(greet(person: "Anna"))

// 🎯函数无返回值
func greetWithoutReturn(person: String){
    print("Hello, \(person)!")
}
print(greetWithoutReturn(person: "k")) // ()
// 严格来讲，上面的函数还是有一个返回值的，尽管没有定义返回值。没有定义返回类型的函数实际上会返回一个特殊的类型Void。它其实是一个空的元组，作用相当于是一个没有设置元素的元组，可以写作（）。

// 🎯多个返回值函数 (通过元组实现)
func minMax(array: [Int]) -> (min: Int, max: Int){
    var currentMin = array[0]
    var currentMax = array[1]
    for value in array[1..<array.count] {
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

// 🎯可选元组返回类型
func minMaxHandleArrayEmpty(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds1 = minMaxHandleArrayEmpty(array: []){
    print("min is \(bounds1.min) and max is \(bounds1.max)")
}

// 🎯隐式返回函数
func greetingWithSingle(for person: String) -> String{
    "Hello, " + person + "!"
}
print(greetingWithSingle(for: "Dave"))
// greetingWithSingle(for: ) 函数的整个定义是返回一个打招呼，也就是说它可以使用这个简化格式。如果一个函数内部只有一行语句，那么默认会返回这个表达式计算的结果，可以省略那个return。（上面函数的参数for为实际参数标签，person为形式参数标签，如果省略实际参数标签，那么会以形式参数标签作为实际参数标签来使用。）

// 函数实际参数标签和形式参数名
// 每一个函数的形式参数都包含实际参数标签和形式参数名，实际参数标签用在调用函数的时候，在调用函数的时候每一个参数前面都要写实际参数标签。形式参数名用在函数的实现中。默认情况下，🎈形式参数使用它们的形式名作为实际参数标签。

func someFunction(argumentLabel paramterName: Int){
    // In the function body, paramterName refers to the argument value
    // for that parameter.
    // 如果你在一个形式参数重提供了实际参数标签，那么这个实际参数标签就必须在调用函数的时候使用标签。
}
// 🎈 实际参数标签的使用能够让函数的调用更加明确，更像是自然语句，同时还能提供更可读的函数体并清晰的表达你的意图。

// 🎯省略实际参数标签
func someFunction1(_ firstName: Int, secondName: Int){
    
}
// 对于函数的形式参数不想被充当为实际参数标签时，可以利用下划线（ _ ）来为这个形式参数代替显式的实际参数标签。
someFunction1(1, secondName: 2)

// 🎯默认形式参数值(ps: 给参数指定默认值也不允许省略参数的类型信息)
func someFunction2(paramterWithDefault: Int = 13){
    // In the function body, if no arguments are passed to the function
    // call, the value of paramterWithDefault is 13.
}
// 🎈 把不带有默认值的形式参数放到函数的形式参数列表中带有默认值的形式参数前面，不带有默认值的形式参数通常对函数有着重要意义。

// 🎯可变形式参数
// 一个可变形式参数可以接受零个或多个特定类型的值。当调用函数的时候米可以利用可变形式参数来声明形式参数可以被传入值的数量时可变的。可以通过在形式参数类型名称的后面吃啊入三个点符号（...）来书写可变形式参数。
func arithmeticMean(_ numbers: Double...) -> Double{
    var total: Double = 0
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))
