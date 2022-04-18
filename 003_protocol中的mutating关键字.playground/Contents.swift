import UIKit

protocol vehicle{
    var numOfWheels:Int{get}
    var color:UIColor{get set}
    //如果 changeColor 打算修改 color，那么对于结构体来说，该方法必须是 mutating的
    mutating func changeColor()
}

struct myCar :vehicle{
    var numOfWheels: Int
    
    var color: UIColor
    //如果 changeColor 打算修改 color，那么对于结构体来说，该方法必须是 mutating的
    mutating func changeColor() {
        color = UIColor.red
    }
}
