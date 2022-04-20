import UIKit
//1. 使用元组原地交换（书中过时 inout应放在类型T前面，而不是变量前面）
func swap<T>(a:inout T,b:inout T){
    (a,b) = (b,a)
}
var a = "11"
var b = "22"
swap(a: &a, b: &b)
//a = "22" b = "11"
print(a)
print(b)


//2. 使用元组返回多参数 (书中过时，CGRectMake方法已经失效，rect.rectsByDividing方法也换名字了)
let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
let (small, large) = rect.divided(atDistance: 20, from: .minXEdge)
print(small)
print(large)

