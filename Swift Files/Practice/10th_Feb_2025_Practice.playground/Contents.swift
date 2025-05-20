import UIKit



/*
 Initialization
 Set the initial values for a type’s stored properties and perform one-time setup.
 */


struct Fahrenheit {
    var temp : Double
    init(){
        temp = 0.0
    }
}


var f = Fahrenheit()
f.temp = 12
print(f.temp)

//Initialization Parameters

struct ParamInit {
    var num : Int
    
    init(assignthree : Int){
        num = assignthree
    }
    init(_ assignfive : Int){
        num = assignfive
    }
}

var obj = ParamInit(3)
print(obj.num)

//Optional Property Types

class ApiResponce {
    var text : String
    var respoce : String?
    init(mytext text : String) {
        self.text = text
    }
}

var api1 = ApiResponce(mytext : "hi")
api1.text = "Hi and hello"
print(api1.text)
api1.respoce = "hello"
print(api1.respoce!)


//Memberwise Initializers for Structure Types
struct Size {
    var width = 0, height = 0
}

//var size1 = Size(width: 12,height: 10)
var size2 = Size(height: 100)
print(size2.width)
print(size2.height)


// parameters and argument label
struct Car {
    var name : String = "abc"
    var price : String = "1000000"
    init(_ name : String){
        self.name = name
    }
//
//    init(_ price : String){ // invalid, it's looks same init as prev
//        self.price = price
//    }
}

var carobj = Car("bmw.1")
var carobj1 = Car("1000000")
print(carobj.name)
print(carobj1.price)


// Default values

class Person {
    var name: String?
    var age = 18
    var isIndian = true
}

var personobj = Person()
print(personobj.isIndian)

// memberwise initializer only for struct not for class

struct MemberwiseInit {
    var name: String
    var age: Int = 9
}

var memobj = MemberwiseInit(name: "sk")
print(memobj.name)
print(memobj.age)

//class MemberwiseInit {
//    var name: String
//    var age: Int = 9
//}
//
//var memobj = MemberwiseInit(name: "sk")
//print(memobj.name)
//print(memobj.age)

//Initializer Delegation
struct InitDeleg {
    var name : String = ""
    
    init(){
        print("From init 1")
    }
    
    // we can only use a self.init in another init
    init(name : String){
        self.init()
        print("From init 2")
        self.name = name
    }
}

var initdelegobj = InitDeleg(name: "Daniyal")

struct Size1 {
    var width: Int
    var height: Int
    
    init() {
        self.init(width: 0, height: 0)
    }

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
}
print()
var s = Size1()
print(s.height)


// Class Inheritance and Initialization
// Designated Initializers (Main initializer) && Convenience Initializers (Shortcut initializer)
//init(parameters) {
//   statements
//}
//convenience init(parameters) {
//   statements
//}

//Two-Phase Initialization
// 1 : In the first phase, each stored property is assigned an initial value
// 2 : Customizing the Object

//Inherit or Override Initializers

class SuperClass {
    var num = 0
    init(){
        self.num = 10000
    }
}

class BaseClass: SuperClass {
    var newnum: Int
    init(newnum : Int) {
//        super.init()
        self.newnum = newnum
    }
}

var baseobj = BaseClass(newnum: 1000)
print(baseobj.num)


@propertyWrapper
struct NotAZeroOrLess {
    private var number: Int = 0
    
    var wrappedValue : Int {
        get { number }
        set { number = max(0, newValue) }
    }
}

struct MyStruct {
    @NotAZeroOrLess var age : Int
}


var mystructobj = MyStruct()
mystructobj.age = 12
print(mystructobj.age)
mystructobj.age = -1
print(mystructobj.age)
print(mystructobj.age)




func wrapop(op : Int?){
    guard let ans = op else {
        print("No value")
        return
    }
    print("the value is \(ans)!")
}

wrapop(op: nil)

func greet(isTruw : Bool, name : @autoclosure () -> String){
    print("greet is colled")
    if isTruw {
        print("Good morning \(name())")
    }
}


func givename(name : String) -> String {
    print("Give name is colled")
    return name
}


greet(isTruw: true, name: givename(name: "Sk"))
greet(isTruw: false, name: givename(name: "DNioyal"))

//Status of the day : 10th_Feb_2025

struct Person1 {
    name : String = ""
    
    init(name : String){
        self.name = name
    }
}

var pers1 = Person1(name: "name")
pers1.name = "daniyal"

print(pers1.name)
