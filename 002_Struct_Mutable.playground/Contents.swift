import UIKit

//2. Struct Mutable
struct User {
      var age : Int
      var weight : Int
      var height : Int
    
    //下面这个方法会报错 Left side of mutating operator isn't mutable: 'self' is immutable
//    func gainWeight(newWeight: Int) {
//           weight += newWeight
//    }
    
    //正确方法，加入 mutating 关键字
    mutating func gainWeight(newWeight: Int) {
               weight += newWeight
    }
}

var u = User(age: 20, weight: 100, height: 170)
u.gainWeight(newWeight: 50)
