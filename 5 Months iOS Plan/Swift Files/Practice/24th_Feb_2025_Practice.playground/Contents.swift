import UIKit


/*
checkout about Storyboard and xib and view Controller , view
app life cycle
view life cycle
in iO
*/


//class Person {
//    weak var apartment: Apartment?
//    init() {
//        print("Person init")
//    }
//    deinit {
//        print("person is being deinitialized")
//    }
//}
//
//
//class Apartment {
//    weak var person: Person?
//    init() {
//        print("Apartment init")
//    }
//    deinit {
//        print("apartment is being deinitialized")
//    }
//}
//
//var person: Person?
//var apartment: Apartment?
//
//person = Person()
//apartment = Apartment()
//
//person?.apartment = apartment
//apartment?.person = person

//person = nil
//apartment = nil


protocol Sample {
    func printall()
}


extension Array : Sample where Element == String {
    func printall() {
        for i in self {
            print(i)
        }
    }
}


var arr = ["a","sx","sd"]
var arr1 = [1,2,3,4]

//arr.printall()
//arr1.printall()



let a: Int?



class Superclass {
    var age: Int?
}

class Subclass: Superclass {
    override var age: Int? {
        get {
            return super.age
        } set {
            self.age = newValue
        }
    }
}


let obj = Subclass()
print(obj.age)

obj.age = 35
print(obj.age)







