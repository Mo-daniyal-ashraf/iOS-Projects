import UIKit


//
//class Father {
//    var salary: Int
//    var name: String
//    var income: Int {
//        return 12 * salary
//    }
//    func work(){
//        print("father is working")
//    }
//    init?(salary: Int, name: String){
//        if age > 20 {
//            return nil
//        }
//        self.salary = salary
//        print(self.name)
//    }
////
////    convenience init(name: String){
////        self.init(salary: 20000, name: name)
////    }
//
//}

//class Son {
//    override var salary: Int
//
//    override var income: Int {
//        return 10 * salary
//    }
//
//    override func work() {
//        print("son is working")
//    }
//
//    init(age: Int, salary: Int) {
//        self.age = age
//        super.salary = salary
//    }
//}
//
//var son1 = Son(age: 20)
//son1.work()
//print(son1.age)
//


//struct Person {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int){
//        self.name = name
//        self.age = age
//    }
//
//    convenience init(name: String){
//        self.init(name: name, age: 20)
//    }
//}

//var obj = Person(name: "daniyal")
//print(obj.age)

//enum Dir: String{
//    case north = "n"
//    case south = "s"
//    case west = "w"
//    case east = "e"
//
//    init(rawvalue: String){
//        switch rawvalue {
//            case
//        }
//
//    }
//}
//
//var obj = Dir(rawValue: "w")
//
//print(obj)


class Person {
    var ulr: String
    
    init(url: String){
        self.ulr = url
    }
    
    deinit {
        print("cleanup")
    }
}

class Media {
    
}

class Movie: Media {
    var name: Any
    
    init(name: String){
        self.name = name
    }
}

class Song: Media {
    var name: String
    init(name: String){
        self.name = name
    }
}

var arr = [Movie(name: "a"),Movie(name: "b"), Song(name: "c")]

var m = Movie(name: "d")

//var temp = m.name as String ?? "s"
//
//print(temp)


class A {
    var value: Int?
    
    func greet(){
        print("Hello")
    }
}


var a1: A? = nil

let a = a1?.greet()

print(a)


func greet(isgreet: Bool, name: String){
    print(1)
    if isgreet {
        print("Hi \(name)")
    }
}

func getnmae(name: String) -> String {
    print(2)
    return name
}

print()
greet(isgreet: true, name: getnmae(name: "mohd"))
greet(isgreet: false, name: getnmae(name: "daniyal"))

//
//enum Dir: String, Int {
//    case north = "w"
//    case west = 12
//}
//
//struct MyValue {
//    var value: Int = 12
//
//    func modifyvalue(){
//        value += 100
//    }
//}
//
//var myvalue1 = MyValue()
//myvalue1.value = 1
////myvalue1.modifyvalue()
//print(myvalue1.value)


var things: [Any] = [1, true, "hi"]

//var a: [Int] = []



var arr1 = [[ "daniyal":1, "ashraf": 1,]]


for i in arr1 {
    for j in i {
        print()
    }
}


 var multiLineString = """
hi this is
dnaiyal
"""

class Product {
    
    init(){
        
    }
}

class Item: Product {
    var name: String
    
    override init() {
        name = "a"
    }
}

var item1 = Item()
print(item1.name)




