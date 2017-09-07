//: Playground - noun: a place where people can play

import UIKit

// 定义一个人属性的 protocol
protocol PersonProperty {
    var height: Int { get set} // cm
    var weight: Double { get } // kg
    // 判断体重是否合格的函数
    func isStandard() -> Bool
}
extension PersonProperty {
    // 给 protocol 添加默认的实现
    func isStandard() -> Bool {
        return self.weight == Double((height - 100)) * 0.9
    }
    // 给 protocol 添加默认属性
    var isPerfectHeight: Bool {
        return self.height == 178
    }
}
struct Person: PersonProperty {
    var height = 178
    var weight = 60.0
    // 如果自定义类型里面创建了遵守的 protocol 中的方法
    // 那么他将覆盖 protocol 中的方法
    //    func isStandard() -> Bool {
    //        return true
    //    }
}
// 创建遵守 PersonProperty 的自定义类型
let p = Person(height: 178, weight: 61.5)
let testWeight = Double((p.height - 100)) * 0.9
// 那么 p 这个自定义类型 天生就有判断这个人身高体重是否合格的方法
p.isStandard() // false
// 同样天生具有判断是否是 Perfect Height 的属性
p.isPerfectHeight // true



var person = Person()
person.height   // 178
person.height = 180
person.height  // 180

person.weight // 120
// 可读可写
person.weight = 130.0 // 130
person.weight
// 当我们把person从Person转换成PersonProtocol时 他就是只读的了
// ❌Cannot assign to property: 'weight' is a get-only property
//(person as PersonProtocol).weight = 120



//通过扩展方法, 可以修改该实例self本身.但是方法前要加 mutating
extension Person{
    mutating func changeSelf()
    {
        self.height = 100
    }
}

var anotherP = Person()
anotherP.changeSelf()
anotherP.height
