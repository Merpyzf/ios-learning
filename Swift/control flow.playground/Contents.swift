import Cocoa


// For-in 循环
// 使用 for-in 循环来遍历序列。比如一个范围的数字，数组中的元素或字符串中的字符。

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

// 遍历字典。当遍历字典时，每一个元素都会返回一个（key ，value）元组。可以在 for-in 循环体使用显式命名来分解元组成员

let numberOfLegs = ["spider": 8, "ant": 6 , "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// for-in 遍历数字区间
for index in 1...5{
    print("index: \(index)")
}
// 在这个例子中， index 是一个常量，它的值在每次遍历开始的时候被自动设置。因此它不需要在使用之前声明。它隐式的循环的声明中声明了。不需要用 let 声明关键字。
//

// 如果不需要序列的每一个值，可以使用下划线来取代遍历名以忽略值。
let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer *= base // 计算 3 的 10 次方，只需要以正确的次数执行循环就可以了。
}
print("\(base) to the power of \(power) is \(answer)")

// stride() 通过 stride() 设置开闭区间每次循环的步长
// stride(from: to: by:) 表示开区间，to指定的量不会被包含
let minutes = 60
for  tickMark in stride(from: 0, to: minutes, by: 5) {
    print("tickMark: \(tickMark)") // 55 end
}

// stride(from: through: by:) 表示闭区间，through执行的量会被包含
for tickMark in stride(from: 0, through: minutes, by: 5){
    print("tickmark: \(tickMark)") // 60 end
}


// repeat-while（类似于 do-while ）. 在判断循环条件之前会先执行一次循环代码块。

var count: Int = 0
repeat{
    count += 10
}while  count > 100


// 利用 if 语句进行可选类型的可选绑定
var a: Int? = 10
// 通过这种语法可以不需要通过！对 a 进行解包，如果 a 是 nil 则会直接进入 else 语句块中
if let value = a, value > 10 {
    print("a > 10")
}else {
    print("a <= 10")
}


// switch
// switch 语句会将一个值与多个可能的模式匹配。然后基于第一个成功匹配的模式来执行合适的代码块。

let someCharacter: Character = "z"
switch someCharacter{
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

// switch 没有隐式贯穿，如果需要贯穿的操作则需要使用  fallthrough 语句声明
let anotherCharacter: Character = "a"

//switch anotherCharacter{
//case "a":
//case "A":
//    print("The letter A")
//default:
//    print("Not the letter A")
//}
// 以上编译不通过，没有隐式穿透要求每一个 case 中必须要包含可执行的语句。

// 在一个 switch 情况中匹配多个值可以用逗号分隔
switch anotherCharacter{
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// 区间匹配
let approximateCount = 63
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12 ..< 100:
    naturalCount = "dozens of"
case 100 ..< 1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There ara\(naturalCount) \(countedThings).")

// 值绑定
let anotherPoint = (2, 0)
switch anotherPoint{
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at(\(x), \(y)")
}
// 三个 switch 情况都使用了常量占位符 x 和 y ，它会从临时 anotherPoint 获取一个或者两个元组值。 第一个情况， case(let x, 0) ，匹配任何 y 的值是 0 并且赋值坐标的x到临时常量 x 里。类似地，第二个情况， case(0,let y) ，匹配让后 x 值是 0 并且把 y 的值赋值给临时常量 y 。最后的情况， case let (x,y) ，声明了一个带有两个占位符常量的元组，它可以匹配所有的值。

// 通过在 switch 中使用 where 分句来检查额外的条件
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// 复合情况
// 多个 switch 共享同一个函数体的多个情况可以在 case 后写doge模式来复合，在每个模式之间用逗号分隔。如果任何一个模式匹配了，那么这个情况都会被认为是匹配的。如果模式太长，可以把它们写成多行。
let c: Character = "e"
switch c {
case "a", "e", "i", "o", "u":
    print("\(c) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(c) is a consonant")
default:
    print("\(c) is not a vowel or a consonant")
}

// guard 提前退出
// guard 语句，类似于 if 语句，基于布尔表达式来执行语句。使用 guard 语句来要求一个条件必须是真才能执行 guard 之后的语句。与 if 不同，guard 语句总是有一个 else 分句，else 分句里的代码会在条件不为真的时候执行。

func greet(person: [String: String]){
    // person["name"] 是一个可选的值
    guard let name = person["name"] else {
        return
    }
    print("hello \(name)")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."

// 如果 guard 语句的条件被满足，代码会继续执行直到 guard 语句后的花括号。任何在条件中使用可选绑定赋值的变量或者常量在 guard 所在的代码块中随后的代码里都是可用的。

// 🎆 相对于使用 if 语句来做同样的事情，通过使用 guard 语句可以提升代码的稳定性。

