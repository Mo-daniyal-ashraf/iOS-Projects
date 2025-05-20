
// Function Argument and omitting Argument Labels
func somefunc(_ person : String) -> String {
    "Hi \(person) !"
}

print(somefunc("daniyal"))

// Variadic Parameters

func vard( _ number : Int...) -> Double {
    var totle = 0
    
    for val in number{
        totle += val
    }
    return Double(totle) / Double(number.count)
    
}

print(vard(1,2,3,4,5,6,6))

//In-Out Parameters
func swapNum(_ a : inout Int, _ b : inout Int){
    var temp = a
    a = b
    b = temp
}

var a = 12
var b = 54
swap(&a, &b)

print(a)
print(b)

//Using Function Types
func addTwonum(_ a : Int , _ b : Int) -> Int {
    return a + b
}

var dosomeTask: (Int, Int) -> Int = addTwonum
print(dosomeTask(4,2))

//Function Types as Parameter Types
func printTask(_ dosomeTask : (Int, Int) -> Int, _ a : Int, _ b : Int){
    print("Result is : \(dosomeTask(a,b))")
}


printTask(dosomeTask, 4, 5)




//Closures
var addingTwoum : (Int,Int) -> Int = {
    (num1, num2) in
    return num1 + num2
}

print(addingTwoum(20,30))

// sorting using func and closuer
//func comp(_ s1 : String, _ s2 : String) -> Bool{
//    return s1 < s2
//}
var clos : (String,String) -> Bool = {
    (s1,s2) in
    return s1 < s2
}
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(names)
print(names.sorted(by: clos))

//Inferring Type From Context
print(names.sorted(by: {s1,s2 in return s1 < s2}))

// Implicit Returns from Single-Expression Closures
var clos2 : (String,String) -> Bool = { $0 > $1 }
//print(names.sorted(by: {a,b in a < b})) // do't use return when having one return expression
print(names.sorted(by: {$0 > $1})) // using $ do not need to use paramerts

// sum of three numbers
var addto : (Int,Int,Int) -> Int = {$0 + $1 + $2}

print(addto(1,2,3))


//- Closure as Function Parameter
func funcWithClosure(_ a : Int, _ b : Int, operation: (Int,Int)->Int) -> Int{
    print("1")
    return operation(a,b)
}

var myClosure : (Int , Int) -> Int = { (a,b) in
    print("2")
    return a + b
}

var res = funcWithClosure(12, 34, operation: myClosure)
print(res)


//Trailing Closures use when closure is the last argument in the function
res = funcWithClosure(10, 12) {$0 + $1}
print(res)
 
// number info english using closure
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map{(num) -> String in
    var output = ""
    var tempnum = num
    repeat{
        output = digitNames[tempnum%10]! + output // ! ->  force-unwrap
        tempnum /= 10
    }while tempnum > 0
    print(num)
    return output
}

print(strings)
print()

//Capturing Values using nested functions
// outer funtion only execute one time and after that we having access of inner function
func makeincrement(amount : Int) -> ()->Int {
    var runningTotle = 0
    print("Outer ")
    func inrement() -> Int{
        print("inner")
        runningTotle =  runningTotle + amount
        return runningTotle
    }
    return inrement
}

var incrementBy10 = makeincrement(amount: 10)
print(incrementBy10())
print(incrementBy10())
print(incrementBy10())
var incrementBy2 = makeincrement(amount: 2)
print(incrementBy2())
print(incrementBy2())
print(incrementBy2())


//Escaping and non-escaping Closures
// cosures are Bydefault non-Escaped
// for making them Escaped use @escaping keyword

//Non-Escaping Closures

func dosomething(completion: ()-> Void){
    completion()
}

dosomething {
    print("Work is complete")
}


