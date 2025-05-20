import UIKit





//Protocol Inheritance

protocol A {
    func doSomething()
}

protocol B {
    func doSomeTaks()
}

protocol C: A,B {
    
}

class sampleClass: C {
//    func doSomething() {
//        print("Doing something")
//    }
    
    func doSomeTaks() {
        print("Doing some task")
    }
}

var objclass = sampleClass()
objclass.doSomething()


// can define the body of method in protocol with the help of protocol extension
extension A {
    func doSomething(){
        print("doing something from protocol A")
    }
}


// Class-Only Protocols
// if you want that a protocol only confrom by a class not struct/enum then for this feature we use AnyObject protocol

protocol SomeClassOnlyProtocol: AnyObject {
    func someTaks()
}

class Person: SomeClassOnlyProtocol {
    func someTaks(){
        print("doing some task in class ..")
    }
}

//struct SomeStruct: SomeClassOnlyProtocol {} // Runtime Error
//enum SomeENum: SomeClassOnlyProtocol{}

// Dp not want to implement the function
// for class use @objc optioanl
// for struct and enum use closure of optioanl ?
protocol OptionalProtocol {
    var greet: (() -> Void)? {get}
}

class OptionalClass: OptionalProtocol {
    var greet: (() -> Void)?
    
}

struct StructClass: OptionalProtocol {
    var greet: (() -> Void)?
    
    
}

//enum EnumClass: OptionalProtocol {
//    var greet: (() -> Void)? = nil // enum can not contain stored properties
//}


// Protocol Composition

protocol Name {
    var name: String { get }
}
protocol Age {
    var age: Int { get }
}

struct Human: Name {
    var name: String
    var age: Int
}

var humanobj1 = Human(name: "daniyal", age: 22)

func printDetails(info: Human){
    print("Name is \(info.name) and age is \(info.age)")
}

printDetails(info: humanobj1)



// Checking for Protocol Conformance
/*
 The is operator returns true if an instance conforms to a protocol and returns false if it doesn’t.

 The as? version of the downcast operator returns an optional value of the protocol’s type, and this value is nil if the instance doesn’t conform to that protocol.

 The as! version of the downcast operator forces the downcast to the protocol type and triggers a runtime error if the downcast doesn’t succeed.
 */


protocol Shape {
    var area: Double { get }
}

class Circle: Shape {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}

struct Cube: Shape {
    let side: Double
    var area: Double {
        return 4 * side
    }
    init(side: Double){
        self.side = side
    }
}

struct Car {
    var name: String = "bmw"
    var area: Double {
        return 100.0
    }

}

let arrayOfObj: [Any] = [Circle(radius: 23), Cube(side: 4), Circle(radius: 8), Car()]

print(type(of: arrayOfObj))

for item in arrayOfObj {
    if let tempItem = item as? Shape {
        print(tempItem)
    }
}

if Circle(radius: 12) is Circle {
    print("true")
}


// Optional Protocol Requirements
// for class -- @objc optional
// for strcut and enum --- (() -> String)?
// we can also create a extension of the protocol for making optional method and propertie

//@objc protocol OptionalMethosAndProperties {
//    @objc optional var name: String { get }
//    @objc optional func greet(name: String) -> String
//}

//protocol OptionalMethosAndProperties {
//    var name: String { get }
//    func greet(name: String) -> String
//}
//extension OptionalMethosAndProperties {
//    var name: String {
//        return "hi"
//    }
//    func greet(name: String) -> String {
//        return ""
//    }
//}

//class PrintGreet: OptionalMethosAndProperties {
//
//}


protocol OptionalMethosAndProperties {
    var name: String? { get }
    var greet: ((_ name: String) -> String)? { get }
}

struct PrintGreet: OptionalMethosAndProperties {
    var name: String?
    
    var greet: ((String) -> String)?
    

}
var printgreetobj = PrintGreet()

if let name = printgreetobj.greet {
    print(name)
}


// Protocol Extensions
// Protocol extensions is use to provide a default implementation to any method or computed property requirement of tha protocol so do not need to implement those methods and properties in class, struct and enum


protocol RandomNumber {
    var range: Int { get }
    func generaterandomNumber() -> Int
}

extension RandomNumber {
    var range: Int {
        return 10
    }
    func generaterandomNumber() -> Int {
        return Int.random(in: 1...range)
    }
//    func hello()
}

class PrintRandomNum: RandomNumber {
    
}
//struct PrintRandomNum: RandomNumber {
//
//}
//enum PrintRandomNum: RandomNumber {
//    case value
//}
print(PrintRandomNum().generaterandomNumber())


// Adding Constraints to Protocol Extensions
extension Collection where Element == String {
    var sizeOfArray: Int {
        return self.count
    }
}

var arr = ["1,2,3,4,4","fv"]
print(arr.sizeOfArray)

extension Dictionary where Key: Numeric, Value: Numeric {
    
    var keySum: Key {
        return self.keys.reduce(0,+)
    }
    var valueSum: Value {
        return self.values.reduce(0,+)
    }
}

let dict: [Int: Int] = [1: 2, 2: 3, 3: 4]
print()

print(dict.keySum)

extension Set where Element: Numeric {
    var getSum: Element {
        return self.reduce(0,+)
    }
}

let myset: Set = [1,2,3,4,5]
print(myset.getSum)





