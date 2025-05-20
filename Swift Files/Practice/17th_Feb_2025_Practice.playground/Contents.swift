import UIKit


//Extension in Protocol

//nExtensions can add new properties, methods, and subscripts to an existing type, and are therefore able to add any requirements that a protocol may demand
// Yes we directly confrom to a protolcol but we use extentsion of the class and then conform to protocol for making the main class to do the main work mean..
// The main struct/class handles the core functionality, and the extension handles extra functionality.


protocol TextRepresentable {
    var textualDescription: String { get }
}

class DiceSuper {
    
}

class Dice2: DiceSuper {
    
}

class Dice: DiceSuper {
    var side: Int; init(side: Int){
        self.side = side
    }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "No of sides: \(side)"
    }
}



let diceobj1 = Dice(side: 12)
print(diceobj1.textualDescription)
let diceobj2 = Dice(side: 8)


// Conditionally Conforming to a Protocol using where clause
// ensures that only arrays containing TextRepresentable elements get the textualDescription property.
// Conditional conformance ensures type safety (Only applicable types conform to protocols).

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemAsText = self.map{ $0.textualDescription }
        return "[" + itemAsText.joined(separator: ", ") + "]"
    }
}

let myDicearr = [diceobj1,diceobj2]
//let myDicearr = [diceobj1,diceobj2,Dicee()] elements will not get textualDescription property
print(type(of: myDicearr))
//let newarr = [1,2,3,4]
print(myDicearr[0].textualDescription)
//print(myDicearr.textualDescription)
//print(newarr)





//class A: Equatable {
//    var name: String = "mohd"
//}
//
//var obj1 = A()
//var obj2 = A()
//
//if obj1 == obj2 {
//    print("same")
//}

protocol Sample {
    func task()
}

extension Sample {
    func greet() -> String {
        return "hello"
    }
    func task() {
    }
}

struct A: Sample {
    
}

var obj1 = A()
print(obj1.greet())
obj1.task()
//enum Person: Sample {
//
//
//}
//var obj1 = Person()

// Adopting a Protocol Using a Synthesized Implementation
// Normally, when a type (like struct or enum) conforms to a protocol, we have to manually implement the required methods. However, Swift can automatically generate these implementations in some cases, saving us time and reducing boilerplate code.

//struct EquatbaleObj: Equatable {
//    var name: String
//}
//
//var object1 = EquatbaleObj(name: "sk")
//var object2 = EquatbaleObj(name: "name")
//
//if object1 == object2 {
//    print("bothh having same value")
//}

// in above exm == checking all properties to be equal
// now i want to check if only name is equal
// in the class equatable does not work so we have define a func colled == for checking the values

//struct EquatbaleObj: Equatable {
//    var name: String
//    var age: Int
//
//    //
//    static func == (lhs: EquatbaleObj, rsh: EquatbaleObj) -> Bool {
//        return lhs.name == rsh.name
//    }
//}
//
//var object1 = EquatbaleObj(name: "mohd", age: 10)
//var object2 = EquatbaleObj(name: "mohd", age: 12)
//
//if object1 == object2 {
//    print("bothh having same value")
//}else {
//    print("both not having same value")
//}

// Equatable in class
class EquatbaleObj: Equatable {
    var name: String
    var age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    static func == (lhs: EquatbaleObj, rsh: EquatbaleObj) -> Bool {
        return lhs.name == rsh.name && lhs.age == rsh.age
    }
}

var object1 = EquatbaleObj(name: "mohd", age: 10)
var object2 = EquatbaleObj(name: "mohd", age: 12)

if object1 == object2 {
    print("bothh having same value")
}else {
    print("both not having same value")
}

// Comparable only for enum, for classes and struct we have to define the < method
struct ComparableStruct: Comparable, Hashable {
    
    static func < (lhs: ComparableStruct, rhs: ComparableStruct) -> Bool {
        return lhs.value < rhs.value
    }
    
    var value: Int
}

var compareobj1 = ComparableStruct(value: 112)
var compareobj2 = ComparableStruct(value: 12)
var compareobj3 = ComparableStruct(value: 11)
var compareobj4 = ComparableStruct(value: 12)

let arr = [compareobj1, compareobj2, compareobj3, compareobj4]

for item in arr.sorted() {
    print(item.value)
}

// Hashable
// for storing the obj in set or dict we have make those object hashable for that we have use hashable protocol, Int, String are by default Hashable

let mySetOfObj: Set = [compareobj1, compareobj2, compareobj3, compareobj4]

for i in mySetOfObj {
    print(i)
}

class Person: Hashable {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }

    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}


// Collections of Protocol Types
// if we having multiple obj of classes, struct and enum and all are comforming the a commmen protocol and if we store all of obj in a colletion then the type of that colletion will that commen protocol

 protocol ColleProtocol {
    var details: String { get }
}


class class1: ColleProtocol {
    var details: String = "daniyal"
}

class class2: ColleProtocol {
    var details: String = "mohd"
}

struct struct1: ColleProtocol {
    var details: String = "ashraf"
}

//enum enum1: ColleProtocol {
//    var details: String = "hi"
//    case value
//}

var arrayOfObj: [ColleProtocol] = [class1(), class1(), class1(), class2(), struct1()]

print(type(of: arrayOfObj))

for i in arrayOfObj {
    if let tempobj = i as? class1 {
        print("\(tempobj) is class1")
    }else if let tempobj = i as? class2{
        print("\(tempobj) is class2")
    }else if let tempobj = i as? struct1{
        print("\(tempobj) is struct")
    }
}










