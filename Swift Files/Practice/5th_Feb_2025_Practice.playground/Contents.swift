

//Enumerations
// A Group of releated values
enum CompassPoint: String,CaseIterable{
    case north = "north"
    case west
    case east
    case south
}
var dir = CompassPoint.north
print(dir)

// Enum with Switch
switch dir{
    case .north:
    print("Go to north")
    case .west:
        print("Go to west")
    case .east:
        print("Go to east")
    case .south:
        print("Go to south")
}
print()
// Iterating over Enumeration Cases
print(CompassPoint.allCases.count)

for dir in CompassPoint.allCases{
    print(dir)
}

/*
 
Associated Values
can store additional data of different types
 
Use raw values when cases have a fixed predefined value.
Use associated values when each case needs to store different types of data dynamically.
*/

enum enumWithAssociatedVlaues{
    case youtube(subs : Int)
    case insta(followers : Int)
    case x
    case linkedin
}

func printEnum(_ platform : enumWithAssociatedVlaues){
    switch platform {
        case .youtube(subs : let subs):
            print("subs of youtube \(subs)")
        case .insta(followers: let followers):
            print("followers of insta \(followers)")
        case .x,.linkedin:
            print("Do not have any asscciated value")
    }
}

print()
printEnum(.insta(followers: 12_00))

//Multi Associated
enum MyEum{
    case basicdetails(name : String, age : Int)
    case location(city : String, country : String)
    case photo(url : String)
}

func printMyEnum(_ details : MyEum){
    switch details {
        case .basicdetails(name: let name, age: let age):
            print("name : \(name) , age : \(age)")
        case .location(city: let city, country: let country):
            print("city : \(city), country : \(country)")
        case .photo(url: let url):
            print("URL : \(url)")
    }
}



printMyEnum(.basicdetails(name: "daniyal", age: 12))


// Row values
enum MyRowValueEnum: String {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
    case none
}

print(MyRowValueEnum.north.rawValue)
print(MyRowValueEnum.north)

// If we do not have a raw value for a case then we will the case
print(MyRowValueEnum.none.rawValue) // none

// for getting Enum case from rawvalue
print(MyRowValueEnum(rawValue: "N")!) // it returns a optional


//Methods Computed Properties
print()
enum CovidVaccine : String{
    case covaxin = "Covaxin"
    case covishield = "Covishield"
    
    //Properties
    var vaccineName: String {
        return self.rawValue
    }
    
    // methods
    func Info(){
        switch self {
            case .covaxin:
                print("\(vaccineName) is the better option")
            case .covishield:
                print("\(vaccineName) Covishield has more side effects")
        }
    }
}

var vaccine = CovidVaccine.covaxin
print(vaccine)
vaccine.Info()
print()

/*
Structures and Classes :
Strcutures are value type and classes are refernce type
Strcutures doe't support Inheritance but classes support
Strcutures, No Deinitializer (deinit) : Classes, Supports deinit for cleanup
*/

// How to Define a struct
struct StructPersion: Equatable {
    var name : String
    var age : Int
}

// How to Define a struct
class ClassPerson {
    var name : String
    var age : Int
    
    init(name : String, age : Int){
        self.name = name
        self.age = age
    }
}

// instance of struct
var structperson1 = StructPersion(name: "Daniyal", age: 22)

var structperson2 = structperson1
structperson2.name = "Sk"
structperson1.age = 19

print(structperson1.name) // Daniyal
print(structperson2.name) // Sk --> Not a Reference type

withUnsafePointer(to: structperson1) { temp in
    print("Memory address \(temp)")
}
withUnsafePointer(to: structperson2) { temp in
    print("Memory address \(temp)")
}
let address = Unmanaged.passUnretained(structperson1).toOpaque()
print("Memory address of obj1:", address)


// instance of struct
var classperson1 = ClassPerson(name: "Daiyal", age: 23)
var classperson2 = classperson1

classperson1.age = 30
print(classperson1.age) // 30
print(classperson2.age) // 30 --> same values mean reference type

if structperson1 == structperson1{
    print("Yes")
}
/*
Status of the Day:

Defining an Enumeration
Using Enums with Switch Statements
Associated Values
Raw Values
Methods Computed Properties
 
Structures and Classes
Comparing Structures and Classes
Structure and Class Instances and Definition Syntax
Strcutures are value type and classes are refernce type
Identity Operators( ====, !== )
 
 */

