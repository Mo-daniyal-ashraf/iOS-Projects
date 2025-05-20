import UIKit

/*
 1. Create two protocols, `Readable` and `Writable`, each requiring a `performAction()` method. Then, define a function `executeActions` that takes an array of objects conforming to both protocols (`Readable & Writable`) and calls `performAction()` on each.
 */



protocol Readable {
    
    func performAction()
}


protocol Writable {
    
    func performAction()
}



class SampleClass: Readable, Writable {
    
    func performAction() {
        
        print("Performing Action in class...")
    }
}


var arrayOfObj: [SampleClass] = [SampleClass(),SampleClass()]

func executeActions(arrayOfObj: [Readable & Writable]) {
    
    for obj in arrayOfObj {
        
        obj.performAction()
    }
}

executeActions(arrayOfObj: arrayOfObj)
print()

/*
 2. Define a protocol Modifiable with a required initializer init(value: Int) and a mutating method modify(), implement it in a Counter struct with a required init(value: Int), and write a function createAndModifyCounter(value: Int) -> Counter that initializes and modifies a Counter before returning it.
 */

protocol Modifiable {
    
    init(value: Int)
    
    mutating func modify()
}

struct Counter: Modifiable {
    
    var value: Int
    
    init(value: Int) {
        
        self.value = value
    }
    
    mutating func modify() {
        
        value += 100
    }
}

func createAndModifyCounter(value: Int) -> Counter {
    
    var counterObj = Counter(value: value)
    counterObj.modify()
    
    return counterObj
}

var cntObj = createAndModifyCounter(value: 12)
print(cntObj.value)




/*
 3. Define a class-only protocol `Drawable` using `AnyObject` with a `draw()` method. Create a subclass `Circle` that conforms to `Drawable`. Then, write a function `checkIfDrawable(_ object: Any)` that verifies if an object conforms to `Drawable` and calls `draw()` if it does.
 */


// Class-only protocol
protocol Drawable: AnyObject {
    
    func draw()
}

class Circle: Drawable {
    
    func draw() {
        print("Drawing ...")
    }
}

func checkIfDrawable(_ object: Any) {
    
    if let tempObj = object as? Drawable {
        tempObj.draw()
    }
}

class TempClass {}

let obj1 = Circle()
checkIfDrawable(obj1)

let obj2 = TempClass()
checkIfDrawable(obj2)

let obj3 = Circle()
checkIfDrawable(obj3)




