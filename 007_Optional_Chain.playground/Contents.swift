class Toy {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Pet {
    var toy: Toy?
}
class Child {
    var pet: Pet?
}


var xiaoming = Child()
xiaoming.pet = Pet()
xiaoming.pet?.toy = Toy(name: "kk")

let toyName = xiaoming.pet?.toy?.name
//虽然name是String类型，但是由于可选链过程中随时可能返回nil，toyName是一个Optional<String>类型
print(type(of: toyName))

//使用if let 可选绑定（optional binding）
if let toyNameV2 = xiaoming.pet?.toy?.name{
    //此时toyNameV2一定有值，且类行为String
    print(type(of: toyNameV2))
}
