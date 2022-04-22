//操作符 重载 和 自定义

import Security
struct Vector2D{
    var x = 0.0
    var y = 0.0
}
//重载 向量Vector2D之间的 + 操作符
func +(left:Vector2D,right:Vector2D)->Vector2D{
    return Vector2D(x: left.x+right.x, y: left.y+right.y)
}
//调用
let v1 = Vector2D(x: 1.0, y: 1.0)
let v2 = Vector2D(x: 1.0, y: 1.0)
print(v1+v2)


//自定义 一个全新操作符 +* 用来计算向量的点积
//1. 定义优先级组
precedencegroup MinePrecedence {
//    lowerThan: AdditionPrecedence       // 优先级, 比加法运算低
    higherThan: AdditionPrecedence   // 优先级,比加法运算高
    associativity: left                 // 结合方向:left, right or none
    assignment: false                   // true=赋值运算符,false=非赋值运算符
}
//2. 声明操作符 +* infix关键字表明是一个中缀操作符，中缀操作符比较特殊，需要指定 precedence group
infix operator +*:MinePrecedence
//3. 实现操作符
func +*(left:Vector2D,right:Vector2D)->Double{
    return left.x * right.x + left.y * right.y
}
//调用 输出点积=2.0
print(v1 +* v2)
