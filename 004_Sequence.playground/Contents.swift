//对于自定义变量来说，目前swift已经支持了Sequence、IteratorProtocol协议
//无需自己定义迭代器协议和序列协议，只需要将自己定义的struct实现上述两个协议即可
 
//下面实现一个倒着遍历的泛型数组结构
struct ReverseSequence<T>: Sequence, IteratorProtocol {
    var array: [T]
    var count: Int
    
    init(array: [T]){
        self.array = array
        count = self.array.count - 1
    }
    
    //重点，提供一个访问next元素的方法（IteratorProtocol）
    mutating func next() -> T? {
        if count < 0 {
            return nil
        } else {
            defer { count -= 1 }
            return self.array[count]
        }
    }
}
let intArray = ReverseSequence(array: [1,2,3,4])
let strArray = ReverseSequence(array: ["aa","bb","cc","dd"])
for i in intArray {
    print(i)
}

for i in strArray{
    print(i)
}
