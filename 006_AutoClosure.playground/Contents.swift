
//定义一个入参为闭包的函数
func logIfTrue(predicate: ()->Bool){
    if predicate() {
        print("true")
    }
}
//正常调用
logIfTrue(predicate: {return 2 > 1})

//简化调用
logIfTrue(predicate: {2 > 1})

//尾随闭包方式调用
logIfTrue {
    2 > 1
}

//使用auto Closure
func logIfTrueV2(predicate:@autoclosure ()->Bool){
    if predicate() {
        print(true)
    }
}
logIfTrueV2(predicate: 2>1)

var level : Int?
var startLevel = 1
var currentLevel = level ?? startLevel
