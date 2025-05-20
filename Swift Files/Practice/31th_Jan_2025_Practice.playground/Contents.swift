

// Optional
let name: Any = "daniyal"
print(name)

let age: Int? = nil
print(age)

// Optional binding
var sentence: String? = "Hey this daniyal"
// 1- if let

if let temp = sentence {
    print("this is the sentence \(temp)")
}else{
    print("sentence is nill")
}

// 2 - gaurd
//guard let temp2 = sentence else {
//    print("No sentence provided")
//}
//print("Welcome, \(temp2)!")

// 3 - Where if let
let age1: Int? = 14
if let temp3 = age1, temp3 >= 18{
    print("Can vote")
}else{
    print("can not vote")
}

// 4 - Default/fallback values
let name2: String? = nil
let printName = name2 ?? "Daniyal"
print(printName)



// Basic Operators
//1. Arithmetic Operators (+, -, *, /, %)
//2. Comparison Operators (==, !=, >, <, >=, <=)
//3. Logical Operators (&&, ||, !)
var x = 2
if x == 2 || x > 10 && x == 72 { // not clear while using mutiple logical operators
    print(x)
}else{
    print("hello")
}
    
//4. Assignment Operators (=, +=, -=, *=, /=, %=)

//Ternary Conditional Operator
var a = 12
let new_a = a == 12 ? "Yes" : "No"
print(new_a)

// Control Flow
// 1 : For-In Loops
for i in (1+1)..<5{
    print(i)
}
        
// 2 : while Loop
var j = 4
while j > 0 {
    print("Hi")
    j -= 1
}
// 3 : repeat while loop
var z = 0
repeat{
    print(z)
    z += 1
}while z < 5


// Conditional Statements
var value = 1
if value == 12{
    print("The value is : \(value)")
}else if value == 11{
    print("The value is : \(value)")
}else if value == 10{
    print("The value is : \(value)")
}else{
    print("Not valid value!")
}

var range1 = ...10
if range1.contains(2) {
    print("Yes")
}

//var val = 17
//let message = if val >= 18 {
//    "Can vote"
//}
//else{
//    "cont not vote"
//}

// Switch statement

let fruit = "Apple"
switch fruit {
case "Apple":
    print("It's an apple 🍎")
case "Banana":
    print("It's a banana 🍌")
case "Orange":
    print("It's an orange 🍊")
default:
    print("Unknown fruit")
}

let ch: Character = "a"

switch ch{
case "a":
    print("This is \(ch)")
case "b":
    print("This is \(ch)")
default:
    print("unknown char")
}

//let anotherCharacter: Character = "a"
//let message = switch anotherCharacter {
//case "a":
//    "The first letter of the Latin alphabet"
//case "z":
//    "The last letter of the Latin alphabet"
//default:
//    "Some other character"
//}
//print(message)


var ch1 = "a"
switch ch {
case "a","A":
    print("A or a")
case "b","B":
    print("B or b")
default:
    print("Unknown")
}

// temperature finder using switch
let temperature = 3
switch temperature{
case ..<0:
    print("freezing..")
case 0..<10:
    print("Very cold")
    fallthrough
    break
case 10...20:
    print("Normal cold")
case 20...30:
    print("Warm")
default:
    print("Hot")
}

// switch with tuples
let somePoint = (1, 0)

switch somePoint {
case (0,0):
    print(somePoint)
case(_,0):
    print("matched second value \(somePoint.1)")
case(0,_):
    print("matched first value \(somePoint.0)")
default:
    print("Not matched")
}

//Control Transfer Statements
//continue
//break
//fallthrough
//return
//throw
