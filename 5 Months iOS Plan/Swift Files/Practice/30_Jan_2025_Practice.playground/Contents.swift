

// About Swift
// Type safe language
// OOP

// First programe for printing  "Hello world"
print("Hello, world!")



// Constants Values can not be changed
let a = 12;
// a = a + 1
print(a)

// Variables can be change
var b = 10
// b = b + 1
print(b)

//  YWe can declare multiple constants or multiple variables on a single line,
let first = 23, ssecond  = 12, third = 20
print(first)
print(ssecond)
print(third)


// Type Annotations
var str: String = "Hello"

var num: Int = 10
var pi: Double = 3.14
var isSwiftAwesome: Bool = true


// Integers
// var a = UInt8.min
//print(a) // 0
// a = UInt8.max
//print(a) // 255

//var b = UInt32.min
//print(b) //0
//b = UInt32.max
//print(b) //4294967295

// Floating-Point Numbers
let d: Float = 1.234534343242323212
print(d) //1.2345344
let e: Double = 3.1423567845432234564432445543
print(e) //3.1423567845432236

// Numeric Type Conversion
let a1: UInt8 = 12
print(a1)

// Integer and Floating-Point Conversion

let three: Double = 3
let afterPoint = 0.141576546776
let new_pi = Float(three) + Float(afterPoint)
print(new_pi)

// From Double to Int
let num_pi = Int(new_pi)
print(num_pi)


// Type Aliases: typealias
//To improve code readability.
//When dealing with long, complex types.
//To create more meaningful names for standard types.

typealias ID = String
let userId: ID = "asghfhsdj26554@"
print(userId)


//Booleans: true/false
var valid: Bool = true
print(valid)
valid = false
print(valid)

if valid == true {
    print("Yes valid")
}else{
    print("Not valid")
}


// Tuples: he values within a tuple can be of any type
let http404Error = (404, "Not found") //(Int, String)
let (statusCode, statusMessage) = http404Error
print(String(statusCode) + " : " + statusMessage)
print(http404Error.0)
print(http404Error.1)

print(1)


