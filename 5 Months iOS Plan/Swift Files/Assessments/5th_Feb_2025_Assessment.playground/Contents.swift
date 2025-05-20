
/*
1. Define an `enum` called `Shape` that has cases for `circle(radius: Double)`, `rectangle(width: Double, height: Double)`, and Square(`height: Double`). Implement a method inside the `enum` to calculate the area of each shape.
 .
 */

enum Shape{
    case circle(redius : Double)
    case rectangle(width: Double, height: Double)
    case square(height: Double)
    
    func calculateArea(){
        switch self {
            case .circle(redius : let radius):
                var area = 3.14 * Double(radius*radius)
                print("Area of Circle is : \(area)")
            
            case .rectangle(width: let width, height: let height):
                var area = width * height
                print("Area of Rectangle is : \(area)")
            
            case .square(height: let height):
                var area = height * height
                print("Area of Square is : \(area)")
        }
    }
}

var calculateArea = Shape.square(height: 5)
calculateArea.calculateArea()

Shape.rectangle(width: 12, height: 10).calculateArea()
print()

/*
2. Define an `enum` called `ArithmeticOperation` with cases for `addition`, `subtraction`, `multiplication`, and `division`. Implement a method that takes two integers and a closure as parameters, applies the corresponding operation using the closure, and returns the result.
 */

enum ArithmeticOperation{
    case addition
    case subtraction
    case multiplication
    case division
    
//    var operation : (Int,Int) -> Int {
//        switch self {
//            case .addition:
//                return { $0 + $1 }
//            case .subtraction:
//                return { $0 + $1 }
//            case .multiplication:
//                return { $0 + $1 }
//            case .division:
//                return { $0 + $1 }
//        }
//    }
    
    func calculate(_ a : Int, _ b : Int, using closure : (Int,Int) -> Int ) -> Int{
        return closure(a,b)
    }
}

//let addClosure: (Int, Int) -> Int = { $0 + $1 }
let addClosure: (Int, Int) -> Int = {
    (a, b) in
    return a + b
}
let subtractClosure: (Int, Int) -> Int = { $0 - $1 }
let multiplyClosure: (Int, Int) -> Int = { $0 * $1 }
let divideClosure: (Int, Int) -> Int = { $0 / $1 }

var operation = ArithmeticOperation.addition
print(operation.calculate(12, 10, using: addClosure))
print()




/*
 3. Define an `enum` called `Weekday` that conforms to `CaseIterable` and includes all seven days of the week. Write a function that takes a closure as a parameter and applies it to every weekday, returning an array of results
 */

enum Weekday: String, CaseIterable {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    
    static func printAllRawvalues( -> [String]{
        var ansArray: [String] = []
        for day in Weekday.allCases{
            ansArray.append(day.rawValue)
        }
        return ansArray
    }
}



var arrayOfDays = Weekday.printAllRawvalues()
print(arrayOfDays)
