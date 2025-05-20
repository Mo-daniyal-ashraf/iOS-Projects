import UIKit

// 1 : Write a `switch` statement that prints the letter grade (`A`, `B`, etc.) based on the input score.

var marks = 86

switch marks {
case 95...100:
    print("A++")
case 90...94:
    print("A+")
case 85...89:
    print("A")
case 80...84:
    print("B++")
case 75...79:
    print("B+")
case 70...74:
    print("B")
case 65...69:
    print("C++")
case 60...64:
    print("C+")
case 55...59:
    print("C")
case 33...54:
    print("D")
case 0...32:
    print("Fail")
default:
    print("Enter a valid number!")
}

//2 : - Write a Swift program to print a pyramid pattern of stars
// using for
var n = 7
var noStar = 1
var noSpace = n - 1

for _ in 0..<n {
    for _ in 0..<noSpace {
        print(" ",terminator:"")
    }
    for _ in 0..<noStar {
        print("*",terminator:"")
    }
    print()
    noStar += 2
    noSpace -= 1
}

// using while
noStar = 1
noSpace = n - 1
while n > 0{
    var i = noSpace
    var j = noStar
    while  i > 0 {
        print(" ",terminator:"")
        i -= 1
    }
    while j > 0 {
        print("*",terminator:"")
        j -= 1
    }
    print()
    noStar += 2
    noSpace -= 1
    n -= 1
}










