//import UIKit
//
//

//Optional Chaining
/*
 Why use optional chaining:
 - used for getting the value of properties, methods, and subscripts
 - An alternative way of forcde unwrap
 - Avoid runtime error
 - work in multiple lavel mean chain, if one chain is nil then immediately return nill
 - If any part of the chain is nil, the entire expression returns nil instead of crashing.
 - the result of optional chaining is always an optional value
 */

var arr: [String]? = ["mohd","daniyal","ashraf"]
var ch = arr?.randomElement()?.first?.uppercased() // multiple level / Chaining
 print(ch ?? "x")

class Person {
    var residence: Residence?
}

class Residence {
    var numrooms: Int = 12
}

var daniyal = Person()
daniyal.residence = Residence()
var a: Int? = 12
if let noromme = daniyal.residence?.numrooms {
    print(noromme)
}

// optinal chaining in complex class

class Student {
    var clg: College?
}

class College{
    var address: Address?
}

class Address {
    var city: String?
    var area: String?

    init(city: String, area: String){
        self.city = city
        self.area = area
    }

    func printads(){
        print("city: \(city!), Area: \(area!)")
    }
}

let jhon = Student()
var colg = College()
var ads = Address(city: "new delhi", area: "shaheen bagh")

jhon.clg = colg
jhon.clg?.address = ads
jhon.clg?.address?.printads()


if let city = jhon.clg?.address?.city{
    print(city)
}else{
    print("no city")
}

//Accessing Subscripts of Optional Type

var dict = ["mohd": [3,4,5], "daniyal": [10,11,12]]
//dict["s"]![0] = 100 // runtime error
dict["sk"]?[0] = 100 // not getting error even the key is not in the dict

print(dict)


/*
 Type Casting:
 Determine a value’s runtime type and give it more specific type information.
 is : for Type Checking
 as? : for Optional Downcasting
 as! : for Force Downcasting
 as : for Upcasting
 */

class Media {
    var name: String
    init(name: String){
        self.name = name
    }
//    func play(){
//        print("Media played")
//    }
}

class Movie: Media {
    var director: String

    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }

    func play(){
        print("movie played")
    }
}

class Song: Media {
    var singer: String
    init(name: String, singer: String) {
        self.singer = singer
        super.init(name: name)
    }
    func play(){
        print("song played")
    }
}

var arrOfMedia = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", singer: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", singer: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", singer: "Rick Astley")
]


print()
print(type(of: arrOfMedia))

// Checking Type
for item in arrOfMedia {
    if item is Movie {
        print("\(item.name) belong to Movie object")
    }else {
        print("\(item.name) belong to Song object")
    }
}

// Downcasting usingg optional ?
var messg = arrOfMedia[0] as? Movie
print(type(of: arrOfMedia[0]))
messg?.play()

// fprced Downcasting
var mesg1 = arrOfMedia[1] as! Song
mesg1.play()

// Upcasting using as
print()
var m1: Media = Movie(name: "brakeing bad", director: "a.")
print(type(of: m1  ))

m1.play()

//
//// Type Casting for Any and AnyObject
//// ANy - Rpresent an instance of any type, including function types.
//// ANyobject - Represent an instance of any class type.
//
//var things: [Any] = []
//things.append(1)
//things.append(1.0)
//things.append(3.14145978456484)
//things.append("daniyal")
//things.append("c")
//things.append(Movie(name: "Avengers", director: "Marvel."))
//
////var intarr = things.filter({$0 is Int})
//var intarr = things.filter{ $0 is Int }.map{( $0 as! Int ) + 100}
//
//print(intarr)
//print()
//
//for i in things{
//    switch i {
//        case let value as Int:
//            print("Int: \(value)")
//        case let value as Double:
//            print("Double: \(value)")
//        case let value as String:
//            print("String: \(value)")
//        case let value as Character:
//            print("Character: \(value)")
//        case let value as Movie:
//            print("Movie: \(value.name) directed by \(value.director)")
//        default:
//            print("Unknown type")
//    }
//}
//
//class A {
//
//}
//class B {
//
//}
//class C {
//
//}
//
//// AnyObject
//var anyobject: [AnyObject] = [1 as AnyObject,"daniyal" as AnyObject, true as AnyObject]
//print(anyobject)
//print(type(of: anyobject[0]))
//var thingsofAnyObject: [AnyObject] = [A(), B(), C()]
//print(thingsofAnyObject)


class City{
    
}

//class Media: City {
//    var name: String
//
//    init(name: String){
//        self.name = name
//    }
//}
//class Movie: Media {
//
//}
//
//class Song: Media {
//
//}
//
//var arr = [Movie(name: "a"),Movie(name: "b"), Song(name: "c")]
//
//print(type(of: arr))
//
//var m1 = Movie(name : "b")

//var temp: Movie = m1 as! Media
//
//print(type(of: temp))

