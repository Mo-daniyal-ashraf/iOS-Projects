import UIKit

//
//1. Create a class `Vehicle` with a `speed` property and a designated initializer. Then, create a subclass `Car` that adds a `numberOfDoors` property. Ensure `Car` has both a designated and a convenience initializer that allows setting only the `speed`, defaulting `numberOfDoors` to 4.

class Vehicle {
    var speed: Int
    
    init(speed: Int){
        self.speed = speed
    }
}

class Car: Vehicle {
    var numberOfDoors: Int
    
    init(speed: Int, numberOfDoors: Int){
        self.numberOfDoors = numberOfDoors
        super.init(speed: speed)
    }
    
    convenience override init(speed: Int){
        self.init(speed: speed, numberOfDoors: 4)
    }
}

var bmw = Car(speed: 200)
var bugatti = Car(speed: 300)
print(bmw.numberOfDoors)


/*
 2. Define a class `Person` with a required initializer that takes a `name` parameter. Then, create a subclass `Employee` that introduces an additional `employeeID` property and ensures proper initialization while maintaining the required initializer constraint.
 */

class Person {
    var name: String
    
    required init(name: String){
        self.name = name
    }
}

class Employee: Person {
    var employeeID: Int
    
    init(name: String, employeeID: Int){
        self.employeeID = employeeID
        super.init(name: name)
    }
    
    required init(name: String) {
        print("hi")
        self.employeeID = 0
        super.init(name: name)
    }

    func printEmp(){
        print("Name: \(self.name), EmployeeID: \(self.employeeID)")
    }
}


var emp1 = Employee(name: "daniyal", employeeID: 001)
emp1.printEmp()

var emp2 = Employee(name: "raj", employeeID: 002)
emp2.printEmp()

var emp3 = Employee(name: "arav", employeeID: 003)
emp3.printEmp()

var emp = Employee(name: "jhon")
emp.printEmp()



/*
 3. Implement a class `Shape` with a designated initializer that sets a `color` property. Then, create a subclass `Rectangle` that introduces `width` and `height` properties. Add a convenience initializer that allows creating a square by setting only one side length while ensuring all properties are initialized correctly.
 */

class Shape {
    var color: String
    
    init(color: String){
        self.color = color
    }
}

class Rectangle: Shape {
    var width: Double
    var height: Double
    
    init(color: String, width: Double, height: Double){
        self.width = width
        self.height = height
        super.init(color: color)
    }
    
    convenience init(color: String, width: Double){
        self.init(color: color, width: width, height: width)
    }
    convenience init(color: String, height: Double){
        self.init(color: color, width: height, height: height)
    }
    
    func area() {
        let res = self.width * self.height
        print(res)
    }
}


var rec1 = Rectangle(color: "red", width: 4)
rec1.area()



