
/*
 
 1. Define a class called `Rectangle` with properties for `width` and `height`. Implement a computed property to calculate the area. Include a read-only property for the perimeter. Add a property observer to update the area whenever `width` or `height` is changed. Implement a type property for the default unit of measurement (e.g., "cm"). Finally, create an instance method to check if the rectangle is a square.
 */
class Rectangle {
    var width: Int {
        didSet {
            updatedArea = width * height
        }
    }
    
    var height: Int {
        didSet {
            updatedArea = width * height
        }
    }
    
    var area: Int {
        return width * height
    }
    
    var perimeter: Int {
        return 2 * (width + height)
    }
    
    var updatedArea: Int = 0 {
        willSet {
            print("Area will be updated to \(newValue)")
        }
        didSet {
            print("Area updated to \(updatedArea)")
        }
    }
    
    static let unit: String = "cm"
    
    func isSquare() -> Bool {
        return width == height
    }
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        self.updatedArea = width * height
    }
}

var rect = Rectangle(width: 12, height: 10)
print("Initial Area: \(rect.area) \(Rectangle.unit)")
print("Perimeter: \(rect.perimeter) \(Rectangle.unit)")

rect.width = 15
rect.height = 15

print("Is square? \(rect.isSquare())")




/*
 2. Create a struct called `BankAccount` with properties for `accountNumber`, `balance`, and `accountHolder`. Implement a method to deposit an amount and another method to withdraw an amount (ensuring that withdrawals do not exceed the balance). Include a computed property to display the account balance in a different currency (e.g., USD to EUR). Additionally, implement a type method to return the total number of accounts created.
 */

struct BankAccount {
    var accountNumber : Int
    var balance : Int
    var accountHolder : String
    static var cntOfAccount = 0
    
    
    var diplayBalanceInINR : Int {
        return balance * 88
    }
    
    mutating func deposit(depositAmmount : Int){
        self.balance += depositAmmount
        print("\(depositAmmount) deposited Successfully.")
    }
    
    mutating func withdraw(accountNumber : Int, accountHolder : String, withdrawAmmount : Int){
        if self.accountNumber == accountNumber && self.accountHolder == accountHolder {
            if self.balance >= withdrawAmmount {
                self.balance -= withdrawAmmount
                print("\(withdrawAmmount) withdowed Successfully.")
            }else {
                print("Not have Enough Balance!")
            }
        }else {
            print("AccountNumber or AccountHolder is not correct!")
        }
    }
    
    init(accountNumber : Int, balence : Int, accountHolder : String){
        self.accountNumber = accountNumber
        self.balance = balence
        self.accountHolder = accountHolder
        BankAccount.cntOfAccount += 1
    }
    
    func displayAccountDetails(){
        print("""
              AccountHolder : \(self.accountHolder)
              AccountNumber : \(self.accountNumber)
              diplayBalanceInINR : \(self.diplayBalanceInINR)
              """)
    }
}

var acc1 = BankAccount(accountNumber : 101, balence : 3000, accountHolder : "Daniyal")
var acc2 = BankAccount(accountNumber : 102, balence : 5000, accountHolder : "sk")
var acc3 = BankAccount(accountNumber : 103, balence : 24000, accountHolder : "raj")

acc1.withdraw(accountNumber: 101, accountHolder: "Daniyal", withdrawAmmount: 1200)
print()
acc1.displayAccountDetails()

print()



/*
 3. Define a class called `Person` with properties for `firstName`, `lastName`, and `fullName` (as a computed property). Add a method to update the person’s name and ensure that `fullName` updates accordingly. Implement a type property to track the total number of `Person` instances. Also, add a method to compare if two `Person` instances have the same full name.
 */


class Person {
    var firstName : String
    var lastName : String
    static var totalNoofPerson = 0
    
    
    var fullName : String {
        return firstName + " " + lastName
    }
    

    func updateName(newFirstName : String, newLastName : String){
        self.firstName = newFirstName
        self.lastName = newLastName
    }
    
    func isFullNameEqual(otherPerson : Person ) -> Bool {
        return self.fullName == otherPerson.fullName
    }
    
    func toString(){
        print("\(firstName) \(lastName)")
    }
    
    init(firstName : String, lastName : String){
        self.firstName = firstName
        self.lastName = lastName
        Person.totalNoofPerson += 1
    }
    
}

var person1 = Person(firstName: "Mohd", lastName: "daniyal")
var person2 = Person(firstName: "Mohd", lastName: "daniyal")
var person3 = Person(firstName: "Mohd", lastName: "daniyal")
person1.toString()
//print(person1.fullName)÷\

person1.updateName(newFirstName: "Mohd", newLastName: "Ashraf")
person1.toString()
print(person1.fullName)

print(person2.isFullNameEqual(otherPerson: person3))

print("No of person :",Person.totalNoofPerson)
