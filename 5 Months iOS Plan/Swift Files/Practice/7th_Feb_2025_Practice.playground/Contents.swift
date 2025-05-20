



/*
Inheritance :

Inheriting the properties, methods and characteristics from one class to another class college inheritance
 */

class Father{
    var car = "Bmw"
    var income : Int { return 200000 }
    
    func useCar(){
        print("father car in use.")
    }
}

class Son : Father {
    override var income: Int { return 100000 }
    var salary : Int { return 20000 }
    override func useCar() {
        print("father car in use by son.")
    }
}

var sunobj = Son()
sunobj.useCar()
print(sunobj.income)
print(sunobj.salary)
print()



class Engine {
    var enginePrice : Int = 87000
    func useEngine(){
        print("Engine in use !")
    }
}



class Car : Engine {
    var carname : String
    override func useEngine(){
        super.useEngine()
        print(super.enginePrice)
        print("Using car engine !")
    }
    
    init(_ carname : String){
        self.carname = carname
    }
}

var c1 = Car("Toyota")
print(c1.carname)
c1.useEngine()
print()



// Observers

class Main {
    var valueChnage : Int = 0{
        willSet {
            print("value is going to be chnage")
        }
        didSet {
            print("Value has been changed")
        }
    }
}

class Base : Main {
    override var valueChnage : Int {
        willSet {
            print("Base value is going to be change")
        }
        didSet {
            print("Base value has been  changed")
        }
    }
}

print()
var obj1 = Base()
obj1.valueChnage = 09


// multi init

class Product {
    var productname : String
    var productid : Int
    var price : Int
    
    init(_ productid : Int, _ price : Int, _ productname : String){
        self.productname = productname
        self.productid = productid
        self.price = price
    }
    
    init(_ productname : String, _ productid : Int, _ price : Int){
        self.productname = productname
        self.productid = productid
        self.price = price
    }
}

var o1 = Product("car",101,100000)
var o2 = Product(101,20000,"tv")
print(o1.price)
print(o2.price)

// final class

//final class FinalClass {
//    var value : Int = 0
//}
//
//class BaseClass : FinalClass { // Error
//
//}


// Final methods and properties
class FinalClass {
    final var value : Int = 0
    
    final func mymethod(){
        print("Final method can not override! ")
    }
}

class BaseClass : FinalClass {
//    override func mymethod(){
//        print("base function ")
//    }
}

var baseobj = BaseClass()
print(baseobj.value)
