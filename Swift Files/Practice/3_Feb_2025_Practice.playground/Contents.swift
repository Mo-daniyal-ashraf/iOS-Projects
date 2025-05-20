


// String
// String Literals
 let name = "daniyal"
 print(name)

// Mutiline String Literals
let text = """
This is a 'multiline'
string in Swift

"""
print(text)

// Special characters in string
let word = "\'this is sample word\'"
print(word)
let doller = "\u{24}"
print(doller)
let blackHeart = "\u{2665}"
print(blackHeart)
let sparklingHeart = "\u{1F496}"
print(sparklingHeart)


let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks)

//Initializing an Empty String
let s = ""
print(s)
let s2 = String()
print(s2)

if s.isEmpty {
    print("Empty string")
}else{
    print("Have some in string")
}

// String Mutability
var mutable = "this is a "
mutable += "cat"
print(mutable)

let nonMutable = "This is a "
// nonMutable += "Cat" // ERROR
print(nonMutable)

// Char array to string
let charArray: [Character] = ["a","b","c","💖"]
let charToString = String(charArray)
print(charToString)

// Appen to string
var x = "name"
x.append("cdh")
print(x)

// String Interpolation
var value = 10
var text1 = "ten"
let str = "this is number \(value) : \(text1)"
print(str)

print(#""this is a dog \(text1)""#)

print("sum of 10 and 11 is: \(10+11)")

// # in string
let filePath = #"C:\Users\Alice\Documents\file.txt"#
print(filePath)

// Length of a String
let az: Character = "z"
text1 += String(az)
print(text1.count)

//Accessing and Modifying a String
var st = "Hello world"
print(st[st.startIndex]) // for first char
print(st[st.index(before : st.endIndex)]) // for last char

//Collection Types
//Organize data using arrays, sets, and dictionaries.
// 1 : Array
//var arr: Array<Int> = [1,2,3,4]  // Long form
//var arr1 = [Int](1,2,3,4)
var arr: [Int] = [1,2,3,4,5] // shorthand form
for i in arr{
    print(i,terminator: " ")
}
print()

// Deafult values array
let arr2 = Array(repeating: -1, count: 5)
print(arr2)

//Inserting element in an array
arr.append(1) // Insert the element at the end
print(arr)

// Accessing and Modifying an Array
// 1 : arr.count
// 2 : arr.isEmpty
// 3 : arr.append(ele)
// 4 : arr += [1,2,3]
// 5 : arr[idx] accessing the array by index
// 6 : arr[0] = 100
// 7 : arr[1...3] = [100,200,300] updating a range

//arr += [10,20,30]
//for i in 0..<arr.count {
//    print(arr[i],terminator: " ")
//}

// Updation in an array
arr[2] = 100
print(arr)

// Remove
arr.removeSubrange(1...3)
print(arr)

//enumerated in an array
for (idx,ele) in arr.enumerated(){
    print(idx, terminator: " ")
    print(ele,terminator: "\n")
}

// SET
var st1: Set = [11,1,1,2,3,4]


// Insert into set
st1.insert(20)
print(st1)

// contains
if st1.contains(26){
    print("Yes")
}
else{
    print("No")
}

// Iterating Over a Set
for ele in st1.sorted(){
    print(ele)
}

//Performing Set Operations
var set1: Set = [1,2,4,5,6]
var set2: Set = [3,4,6,7,8]

var unionSet = set1.symmetricDifference(set2)//set1.subtracting(set2) //set1.intersection(set2) //set1.union(set2)
print(unionSet)


//Dictionary
// dict.cound
// dict.isEmpty


var emdict: [Int:String] = [:]
var dict: [String:Int] = ["hi":12,"hello":22]
dict["sk"] = 1
dict["daniyal"] = 2
dict["Ashraf"] = 3
print(dict)

//dict["hi"] = nil;
dict.removeValue(forKey: "hi")
print(dict)
//Iterating Over a Dictionary
//for  (key,val) in dict{
//    print(key,terminator: "  ")
//    print(val)
//}
//var keylist = dict.keys
var valueList = dict.values
for keys in valueList{
    print(keys)
}

// Function
func greet( person:String) -> String{
    return "Hello \(person) !"
}
var person = "daniyal"
print(greet(person:"daniyal"))

// function with multiple parameters

func hello(name:String,age:Int) { // do not use -> when having void return type
    print("Your name is \(name) and age is \(age)")
}

hello(name: "daniyal", age: 23)

// Multiple return type
func minMax(array: inout [Int]) -> (min:Int, max:Int){
    var minval = 0
    var maxval = 0
    array.sort()
    minval = array[0]
    maxval = array[array.count-1]
    return (minval,maxval)
}

var myarr = [4,5,6,3,2,1]
var tup: (Int,Int) = minMax(array: &myarr)
print("Min value is \(tup.0)")
print("max value is \(tup.1)")


//var arrayRep = /*[Int]()*/ Array<Int>()
//
//struct CustomStruct: Hashable, CustomStringConvertible {
//    var description: String {
//        return name
//    }
//
//    var name: String
//}
//
//var customSet = Set<CustomStruct>()
//var obj1 = CustomStruct(name: "Kunal")
//var obj2 = CustomStruct(name: "Kunal")
//var obj3 = CustomStruct(name: "Daniyal")
//customSet.insert(obj1)
//customSet.insert(obj2)
//customSet.insert(obj3)
//print(customSet)
//
//func testFunc(value: Int, value2: Double) {
//    print(value)
//    print(value2)
//}
//
//typealias functionSyntax = (Int, Double) -> Void
//var funcType: functionSyntax = testFunc
//
//funcType(0, 0.0)
