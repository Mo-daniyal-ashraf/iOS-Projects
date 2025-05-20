import UIKit


//Modules, Source Files, and Packages
// Access Levels
/*
 open: can be sunclaseed, can access outside module
 public: smiller to open but can not subclassws
 internal: accessable only within module
 fileprivate: accessable only within file
 private: accessable only with in class
 */

// Open and Public

//open enum {} // Error, use public
//open struct {}

class  Father {
    
    var name: String?
    func work(){
        print("Father is working..")
    }
}

class Son: Father {
    
    var salary: Int?
    override func work() {
        print("Son is working..")
    }
}

var sonobj = Son()
sonobj.work()


// Internal

internal struct A {
    
    internal var value = 12
}

struct B {
    
    var obja: A
    init(){
        
        self.obja = A()
    }
    
    func printval() {
        
        print(obja.value)
    }
}

var objB = B()
objB.printval()



// fileprivate
// can use with file
class BankAccount {
    fileprivate var balence: Int = 10000
    
    fileprivate func withdrow(amount: Int) {
        balence -= amount
    }
}

var daniyalaccount = BankAccount()
daniyalaccount.withdrow(amount: 1000)

print(daniyalaccount.balence)


// private

class PrivateClass {
    private var age: Int = 20
    public var tempAge: Int
    
    init() {
        self.tempAge = self.age
    }
    
    func setAge(newAge: Int){
        
        self.age = newAge
    }
    func getAge() -> Int {
        return tempAge
    }
}

var privateObj = PrivateClass()
privateObj.setAge(newAge: 10)
//print(privateObj.age)
print(privateObj.tempAge)



// Tuple type
internal class InternalStruct {}
fileprivate struct PrivateStruct {}

class TupleClass {
     fileprivate var exampleTuple: (InternalStruct, PrivateStruct) = (InternalStruct(), PrivateStruct())
}

 
fileprivate let a = TupleClass().exampleTuple
print(a)


// access level for eums
private enum Dir {
    case south
    case north
    case west
    case east
    
    static func printsomthing() {
        print("doing something...")
    }
}

//var enumOnj = Dir.east
Dir.printsomthing()


private class Sample {
    static func printsomthing() {
        print("doing something...")
    }
}

Sample.printsomthing()



public class A1 {
    fileprivate func someMethod() {}
}


internal class B1: A1 {
    override public func someMethod() {}
}

var B1obj = B1()


// accdss control in subclassing
// a subclass can not have higher access level then super class
// if a super class is fileprivate then subclass must be fileprivate or private not public, open or internal
//fileprivate class Sup {
//
//    private func task() {
//        print("taks from super class")
//    }
//}
//
//private class sub: Sup {
//
//    override func task(){
//        print("taks from sub class")
//    }
//}
//
//private var subobj = sub()
//subobj.task()


// for constant, properties and methods can not have higher access level then its type
internal class F {
    
}

private var objf = F()

// Getters and Setters
class TrackedValue {
    var numberOdChnage = 0
    
    var value: String {
        didSet {
            numberOdChnage += 1
        }
    }
    
    fileprivate init(){
        self.value = " "
    }
}


var trackvalueobj = TrackedValue()
trackvalueobj.value = "a"
trackvalueobj.value = "b"
trackvalueobj.value = "x"
print(trackvalueobj.numberOdChnage)

// memberwise init and access control
struct SampleStruct {
    private var name: String
    
    init(name: String){
        self.name = name
    }
}

var samplestructobj = SampleStruct(name: "mohd")


// Access level with protocol

private protocol AccessLevelProt {
    func someTask() // the func also having private access level
}
//
//public protocol AnotherProtocol: AccessLevelProt {
//
//}

fileprivate protocol InternalProtocol {
    func internalMethod()
}

public struct PublicStruct: InternalProtocol {
    private func internalMethod() {  // Must be at least `internal`
        print("Internal method")
    }
}

protocol A11 {
    func method()
}
extension Int: A11 {
    func method() {
        print("Int")
    }
}

























