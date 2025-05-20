import UIKit


// Automatic referenxe counting
// A memory track and management technique
// Only work for class instance
// Automatically free up the memory for no longer needed instance

// String reference

class Person {

    var name: String

    init(name: String){

        self.name = name
        print("name is initialized ..")
    }

    deinit {

        print("name is deinitialized from memory")
    }
}

var person1: Person?
var person2: Person?
var person3: Person?

person1 = Person(name: "daniyal")
person2 = person1
person3 = person1

person1 = nil
person2 = nil
//person3 = nil


// Strong refernce cycle

//class Person1 {
//
//    var apartment: Apartment?
//
//    init(){
//
//        print("person1 is initialized ..")
//    }
//
//    deinit {
//
//        print("person1 is deinitialized from memory")
//    }
//}
//
//class Apartment {
//
//    var person: Person1?
//
//    init(){
//
//        print("apartment is initialized ..")
//    }
//
//    deinit {
//
//        print("apartment is deinitialized from memory")
//    }
//}
//
//print()
//var daniyal: Person1?
//var galexy: Apartment?
//
//daniyal = Person1()
//galexy = Apartment()
//
//daniyal?.apartment = galexy
//galexy?.person = daniyal
//
//daniyal = nil
//galexy = nil // because of strong refernce cycle the deinit never colled

// ways of resolving string ref

// 1: weak ref: both can be nil


class Person1 {

    var apartment: Apartment?

    init(){

        print("person1 is initialized ..")
    }

    deinit {

        print("person1 is deinitialized from memory")
    }
}

class Apartment {

    var person: Person1?

    init(){

        print("apartment is initialized ..")
    }

    deinit {

        print("apartment is deinitialized from memory")
    }
}

print()
var daniyal: Person1?
var galexy: Apartment?

daniyal = Person1()
galexy = Apartment()

daniyal?.apartment = galexy
galexy?.person = daniyal
//
daniyal = nil
galexy = nil


// 2: unowned reference: one can be nil

class Customer {

    var creditcard: CreditCard?

    init(){
        print("Customer is init...")
    }

    deinit{
        print("Customer is deinit..")
    }
}

class CreditCard {

//    var customer: Customer? can not possible because a creditcard always haveing a customer

    unowned var customer: Customer?

    init(customer: Customer){
        self.customer = customer
        print("CreditCard is init...")
    }

    deinit{
        print("CreditCard is deinit..")
    }

}

print()
var customer1: Customer?
// customer is now having strong ref to creditcard
customer1 = Customer()
// cerditcard having unowned ref to customer
customer1!.creditcard = CreditCard(customer: customer1!)

customer1 = nil


// 3: third case both can not be nil, must have values
// use
class Country {

    var capitalcity: CapitalCity!

    init(capitalcity: CapitalCity){

        self.capitalcity = CapitalCity(country: self)
    }
}

class CapitalCity {

    unowned var country: Country

    init(country: Country) {

        self.country = country
    }
}


// Strong ref with closure

class StrongRefIwthClosure {

    var name: String

    lazy var printName: () -> String = {
        [ unowned self ] in
//        [ weak self ] in
        return self.name
    }

    init(name: String) {
        print("StrongRefIwthClosure is init...")
        self.name = name
    }

    deinit {
        print("StrongRefIwthClosure is deinit...")
    }
}

print()
var closureref: StrongRefIwthClosure?
closureref = StrongRefIwthClosure(name: "daniyal")
print(closureref!.printName())
closureref = nil // not able to free up because of printname still having the self

// we resolve strong ref in closre by capture list
// we define a capture list just befoew closure type in square braces with pairing of the weak or unowned keyword
//
//lazy var printName: () -> String = {
//    [ unowned self ] in
//    return self.name
//}




//---------------------------- --------------
