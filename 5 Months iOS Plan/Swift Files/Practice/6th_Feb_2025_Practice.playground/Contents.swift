import UIKit


//Properties
// Used to define and store values
// 1 ; Stored Proper

struct MyStruct {
    var firstvalue : Int
    var length : Int
}

//var mystruct1 = MyStruct(firstvalue: 12, length: 1)
let mystruct1 = MyStruct(firstvalue: 12, length: 1)
//mystruct1.firstvalue = 23 Constants can not modify

print(mystruct1.firstvalue)


/*
Lazy Stored Properties
lazy properties do not initialize until they are accessed for the first time. Useful for expensive operations.
 */


struct lazyProp{
    var firstvalue : Int
    lazy var myvalue : String = {
        print("hey")
        return "Hello"
    }()
}

var obj = lazyProp(firstvalue: 12)
print(obj.myvalue)
print()

/*
 Computed Properties
 In addition to stored properties, classes, structures, and enumerations can define computed properties, which don’t actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.
*/

class Rectangle {
    var width : Int
    var height : Int

//    var area : Int {
//        return width * height
//    }
    var area : Int {
        get {
            return width * height
        }
        set(newarea) {
            width = newarea / height
        }
    }

    init(width : Int, height : Int){
        self.width = width
        self.height = height
    }
}

var obj1 = Rectangle(width: 12, height: 10)
print(obj1.area)

obj1.area = 100
print(obj1.width)



//Property Observers
class Main {
    var myvalue : Int = 0 {
        willSet(newvalue){
            print("myvalue is about to change from \(myvalue) to \(newvalue)")
        }
        didSet{
            print("myvalue changed from \(oldValue) to \(myvalue)")
        }
    }
}


var o1 = Main()
o1.myvalue = 123



class BankAccount {
    var balance: Double = 0.0 {
        didSet {
            if balance < 0 {
                print("Balance can't be negative Resetting to old value.")
                balance = oldValue
            }
        }
    }
}

var account = BankAccount()
account.balance = 100
print(account.balance) // 100

account.balance = -50  // Invalid change
print(account.balance) // 100 (old value restored)



//Property Wrappers
@propertyWrapper
struct NotZeroOrLess {
    var number = 0
    var wrappedValue : Int {
        get {
            return number
        }
        set {
            if newValue > 0 {
                number = newValue
            }else {
                number = 0
            }
        }
    }
}

struct Mynumber {
    @NotZeroOrLess var number : Int
}

var MynumberObj = Mynumber()
print(MynumberObj.number)
MynumberObj.number = 89
print(MynumberObj.number)
MynumberObj.number = -2
print(MynumberObj.number)




// Globel and local const, var
//Global variables are variables that are defined outside of any function, method, closure,or type context. Local variables are variables that are defined within a function, method, or closure context.

//Type Properties

struct sample {
    var value = 2309
}

var oj = sample()
print(oj.value)
oj.value = 12
print(oj.value)
print()

//Methods
// func that define in a class, struct or in a enum

class Myclass {
    var counter = 0

    func incre(){
        counter += 1
    }

    func increBy(_ num : Int){
        self.counter += num
    }

    func reset(){
        counter = 0;
    }
}


var myObj = Myclass()
myObj.incre()
print(myObj.counter)

myObj.increBy(10)
print(myObj.counter)

myObj.reset()
print(myObj.counter)

//Mutating Methods
struct ModifyMethod {
    var x = 0
    var y = 0

    mutating func modify(_ x: Int , _ y : Int){
        self.x += x
        self.y += y
    }
}

var modifyobj = ModifyMethod()
//modifyobj.x = 123
modifyobj.modify(12, 90)
print(modifyobj.x)


//Type Methods
struct TypeMethods{
    static func helper(_ a : Int, _ b : Int) -> Int{
        return a + b
    }
}

print(TypeMethods.helper(12, 33))

class ClassTypeMethods{
    static func helper(_ a : Int, _ b : Int) -> Int{
        return a + b
    }
}

print(ClassTypeMethods.helper(100, 10))

//Method Overloading

class functionOverload{
    func task(_ Taksname : String, _ taksid : String){
        print("First function")
    }
    func task() -> String{
        "Second function"
    }
}

var a = functionOverload()
print(a.task())
a.task("Learn swift","123")


//Subscript
// Syntax
//Access the elements of a collection.

//subscript(idx : Int)-> Int {
//    get {
//
//    }
//    set {
//
//    }
//}

struct TimesTable {
    var num : Int

    subscript(idx : Int) -> Int{
        return num * idx
    }
}

let timestableobj = TimesTable(num: 12)
print(timestableobj[10])

