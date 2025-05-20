import UIKit

//Extensions

/*
 Extensions add new functionality to an existing class, structure, enumeration, or protocol type
 Add computed instance properties and computed type properties

 Define instance methods and type methods

 Provide new initializers

 Define subscripts

 Define and use new nested types

 Make an existing type conform to a protocol

 Can’t override existing methods

*/

extension Double {
    var km : Double {
        return self * 1000.0
    }
    var cm : Double {
        return self / 100.0
    }
}

var m = 5.cm
print(m)


// Addinf Computed Properties and methods in Extensions(Extensions do not allow stored properties)

extension Int {
    var squared: Int {
        return self * self
    }
    var cube: Int {
        return squared * self
    }

    // methods
    func repeatTask(task : () -> Void){
        for _ in 0...self {
            task()
        }
    }
}

print(4.squared)
3.repeatTask {
    print("daniyal")
}

// Mutating Methods in Extensions for struct and enums

extension Int {
    mutating func square(){ // because int are struct
        self = self * self
    }
}
var a = 3
a.square()
print(a)


// Adding new Subscripts

extension Int {
    subscript(digitIdx : Int) -> Int {
        let length = self <= 0 ? -1 : Int(log10(Double(self))) + 1
        if digitIdx > length {
            return -1
        }
        return (self / Int(pow(10, Double(length - digitIdx)))) % 10
    }
}

print(123453[6])

// Protocol with Extensions
protocol PrintDescriptionProtocol {
    func description()
}
extension Int: PrintDescriptionProtocol {
    func description() {
        print("The number is \(self)")
    }
}

3.description()



//protocol
//- basic protocol
//- protocol Inheritance
//- protocol Extension
//- Using protocol with structs, class and enum
//- Associated Types in protocol
//- Multiple Protocol Conformance

// Protocol syntax
protocol Car {
    func stop()
    func horn()
    func engine()
    func speed()
}


class Toyota: Car {
    func stop() {
        print("stop")
    }

    func horn() {
        print("horn")
    }

    func engine() {
        print("engine")
    }

    func speed() {
        print("speed")
    }
}

var t1 = Toyota()
t1.stop()


// Property Requirements
// Protocols can require properties to be present in any conforming type (struct, class, or enum).
// Protocols only define what properties should exist, not how they should be implemented.

protocol Name {
    var firstNmae: String { get }
    var lastNanme: String { get set }
    var fullNmae: String { get }
}

class Person: Name {
    var firstNmae: String // stored
    var lastNanme: String // stored

    var fullNmae: String { // computed
        return lastNanme + " " + lastNanme
    }

    init(firstName: String, lastNmae: String){
        self.firstNmae = firstName
        self.lastNanme = lastNmae
    }
}

var daniyal = Person(firstName: "mohd", lastNmae: "ahsraf")
daniyal.firstNmae = "sk"
print(daniyal.firstNmae)
print(daniyal.fullNmae)
//

 stored properties by default have get and set but for computed properties we have give get abd set if wanted to.

protocol ExmProtocol {
    static var staticproperty: Int { get }
    var num: Int { get set }
}

class ExmStruct: ExmProtocol {

    static var staticproperty: Int = 100

    var num: Int {
        get {
            return 100
        }
        set {
            self.num = newValue
        }
    }
}


var num1 = ExmStruct()
num1.num = 123
print(num1.num)



protocol Somepro {
    var name: String { get }
}

class SomeClass: Somepro {
    var name: String = "abcd"
}

var obj = SomeClass()
print(obj.name)

// Inltializer in protocol
//protocol Vehcile {
//    init(speed : Int)
//}
//
//class Bmw: Vehcile{
//    required init(speed: Int) { // must use required in init
//        <#code#>
//    }
//}

protocol P {
    var name: String { get }
//    init()
    func task()
}

class A: P {
    var name: String = "a"
    func task() {
        print("h")
    }
}
class B: A {

}

var b = B()
print(b.name)


// protocol Delegation
protocol AdditionDelegated {
    func prindAddResult(result: Int)
}

class Develoepr {
    var managerRef: Manager?
    
    func developerWilladdTwoNum(num1: Int, num2: Int){
        let res = num1 + num2
        managerRef?.prindAddResult(result: res )
    }
}

class Manager: AdditionDelegated {
    var developer: Develoepr?
    
    func addTwoNum(a: Int, b: Int){
        developer?.developerWilladdTwoNum(num1: a, num2: b)
    }
    
    func prindAddResult(result: Int){
        print("Adding of number is \(result)")
    }
    
    init(developer: Develoepr){
        self.developer = developer
        developer.managerRef = self
    }
}

var obj1 = Manager(developer: Develoepr())
obj1.addTwoNum(a: 12, b: 10)
