import UIKit

//initializers in classes:

// 1 : Designated initializers
//These are the primary initializers of a class.
//Every class must have at least one designated initializer.
//They fully initialize all properties before passing control to any other initializer.

class Person {
    var name: String
    var age: Int
    var idnumber: Int
    var salary: Int
    
    
    // Designated initializer
    init(name: String, age: Int, idnumber: Int, salary: Int){
        self.name = name
        self.age = age
        self.idnumber = idnumber
        self.salary = salary
    }
}

class Record {
    func printalldet(){
        var person1 = Person(name: "sk", age: 22, idnumber: 12322, salary: 1233122)
    }
}


// 2 : Convenience initializers
//These call a designated initializer inside the same class.
//They add extra flexibility like setting ***default values.
//They must always call another initializer using self.init()
// Let sappose we want to create a person object with default country name to 'india' there are two way either we can create the object and set the country name to india or we can use Convenience init for setting some default value and call the Designated init

class Person1{
    var name: String
    var country: String
    
    // Designated initializer
    init(name: String){
        self.name = name
        self.country = "india"
    }
    
    // Convenience initializers
//    convenience init(name : String){
//        self.init(name: name, country: "india")
//    }
}

var person2 = Person1(name: "sk")
print(person2.name)
print(person2.country)

// Initializers in super class and sub class

class Vehicle {
    var wheels : Int
    
    init(wheels : Int){
        self.wheels = wheels
    }
}

class Car: Vehicle {
    var brand: String
    
    init(brand: String, wheels: Int) {
        self.brand = brand
        super.init(wheels: wheels) // super call made after initializing the subclass properties
    }
    
    convenience init(brand : String){
        self.init(brand: brand, wheels: 4)
    }
}

var car1 = Car(brand: "toyota")
print(car1.brand)
print(car1.wheels)
print()


// Failable Initializers( use ?, like that init?(){}
/*
 A failable initializer (init?) is used when initialization might fail and return nil. This is useful when:
 1 : Invalid values are passed.
 2 : Initialization conditions aren’t met.
 
 */

struct VoterId {
    var name : String
    var age : Int
    
    init?(name: String, age: Int){
        if age < 18 && name.isEmpty {
            return nil
        }
        self.name = name
        self.age = age
    }
}

if let person = VoterId(name: "", age: -18) {
    print("VoterId created: \(person.name), Age: \(person.age)")
} else {
    print("Invalid age, VoterId creation failed")
}

if let person = VoterId(name: "daniyal", age: 22) {
    print("VoterId created: \(person.name), Age: \(person.age)")
} else {
    print("Invalid age or name, VoterId creation failed")
}
print()


// Failable Initializers for Enumerations
// enum object will be created based on the Temperature symbol
enum TemperatureUnit: String {
    case celsius = "C"
    case fahrenheit = "F"
    case kelvin = "K"
    
    init?(ch : Character){
        switch ch {
            case "c":
                self = .celsius
            case "k":
                self = .kelvin
            case "f":
                self = .fahrenheit
            default:
                return nil
        }
    }
}

let temp1 = TemperatureUnit(ch: "K")
//let temp1 = TemperatureUnit(rawValue: "K")
print(temp1)


// Overriding a Failable Initializer
class Book {
    var name: String?
    
    init() {}
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class RecordBook: Book {
    override init() {
        super.init()
        self.name = "Untitled"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "Untitled"
        }else {
            self.name = name
        }
    }
}

var book1 = RecordBook(name: "daniyal")
//var book1 = RecordBook(name: "")
//var book1 = RecordBook()
print(book1.name!)
print()

// Required Initializers
/*
A required initializer ensures that all subclasses of a class implement the same initializer. This is useful when a base class requires that every subclass provides a specific way of initializing objects.
 
 ***If a subclass defines any other initializer, it must explicitly implement the required init as wel
 */

class Animal {
    var name: String
    
    required init(name: String){
        self.name = name
    }
}

class Cat: Animal {
    var color: String
    
    init(color: String, name: String){
        self.color = color
        super.init(name: name)
    }
    
    required init(name: String) {
        self.color = "white"
        super.init(name: name)
    }
}
class Mamel: Cat {

}
var cat1 = Mamel(name: "cat")
print(cat1.name)
print(cat1.color)



// Setting a Default Property Value with a Closure or Function
print(Int.random(in: 1...10))

class RandomNumber {
//    var num : Int = 0 // A static value
    var num : Int { // A closure thar assign a random value
        return Int.random(in: 1...100)
    }
}

var num1 = RandomNumber()
print(num1.num)


// we can create a chess board having color white and black with a default closure
class Chessboard {
    var geidSize: Int {
        return Int.random(in: 1...8)
    }
    var boardColors : [Bool] {
        var tempboardColors: [Bool] = []
        
        var iswhite = true
        
        for _ in 1...geidSize {
            for _ in 1...geidSize {
                tempboardColors.append(iswhite)
                iswhite = !iswhite
            }
        }
        return tempboardColors
    }
}

var board1 = Chessboard()

for color in board1.boardColors {
    print(color,terminator: " ")
}
print()


// Deinitialization
// using deinit we can do some cleanup or printing something or calling some function or makeing some changes and other things whileing destroying an object
func someTaskToDoOnDeinitialization(){
    print("Performing cleanUp on Deinitialization...")
}

class Number {
    var num: Int
    
    init(num: Int){
        self.num = num
        print("\(num) is alive")
    }
    
    deinit{
        someTaskToDoOnDeinitialization()
    }
}
print()

var number1: Number? = Number(num: 12)
number1 = nil
print()


