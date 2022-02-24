import UIKit

//1. 柯里化 currying

//将多参数函数分多次调用，每次给入一个参数
func addTwoNumbers(a: Int) -> (Int) -> Int{
    return {num in
        return num + a
    }
}
let addTo = addTwoNumbers(a: 4)
let result = addTo(5)
print(result)

//实际应用，将selector
protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject> : TargetAction {
    weak var target: T?
    let action: (T) -> () -> ()

    func performAction() -> () {
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case touchUpInside
    case valueChanged
    // ...
}

class Control {
    var actions = [ControlEvent: TargetAction]()

    func setTarget<T: AnyObject>(_ target: T, action: @escaping (T) -> () -> (), controlEvent: ControlEvent) {
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
    }

    func removeTargetForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }

    func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
}

class MyViewController {
    let button = Control()

    func viewDidLoad() {
        button.setTarget(self, action: MyViewController.onButtonTap, controlEvent: .touchUpInside)
    }

    func onButtonTap() {
        print("Button was tapped")
    }
}
