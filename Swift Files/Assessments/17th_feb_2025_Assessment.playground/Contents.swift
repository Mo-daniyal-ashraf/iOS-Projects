import UIKit
/*
 Question 1:
 Create a `Book` class with properties for `title` (String), `author` (String), and `isAvailable` (Bool, with a default value of `true`). Define a method `borrowBook()` that sets `isAvailable` to `false` and prints whether borrowing was successful, using a closure to perform this action. Then, create a `Library` structure with a `books` property, which is an array of dictionaries where each dictionary stores a book's `title` and `availability status`. Implement a method `addBook(_ book: Book)` to add books to the library, and another method `borrowBook(title: String)` that checks the availability of a book before borrowing it using control flow. Additionally, create a computed property `availableBooks` that returns a list of all available books. Use optional chaining in the `borrowBook(title:)` method to safely access and modify the `isAvailable` property of a book.

 */

class Book {
    
    var title: String
    var author: String
    var isAvailable: Bool = true
    
    init(title: String, author: String){
        
        self.title = title
        self.author = author
    }
    
    func borrowBook(status: (_ text: String) -> Void ) {
        
        if self.isAvailable {
        
            self.isAvailable = false
            status("Borrowes success")
        } else {
            status("borrowed not success")
        }
    }
}

struct Library {
    
    var books: [String: Bool] = [:]
    
    var availableBooks: [String] {
        
        var allbooks: [String] = []
        
        for (title, isAvailable) in books {
            
            if isAvailable {
                allbooks.append(title)
            }
        }
        return allbooks
    }
    
    mutating func addBook(_ book: Book) {
        
        books[book.title] = book.isAvailable
        print("\(book.title) is added successfully!")
    }
    
    mutating func borrowBook(title: String){
        
        if  books[title] != nil && books[title] == true {
            
            books[title] = false
            print("\(title) borrowed successfully!")
        } else {
            
            print("\(title) is not available")
        }
    }
    
}

let book1 = Book(title: "Pride and Prejudice", author: "Jane Austen")

let book2 = Book(title: "Ananda Math", author: "Bankim Chandra Chattopadhyay")

let book3 = Book(title: "Don Quixote", author: "Miguel de Cervantes")

var status =  book3.borrowBook {text in
    print(text)
}

//book3.borrowBook()()

let book4 = Book(title: "Jane Eyre", author: " Charlotte Brontë")


var lib = Library()
lib.addBook(book1)
lib.addBook(book2)
lib.addBook(book3)
lib.addBook(book4)

print()
print("Here are all books: \n \(lib.availableBooks)")
print()
lib.borrowBook(title: "Jane Eyre")
lib.borrowBook(title: "Jane Eyre")
print()
lib.borrowBook(title: "Rich dad poor dad")
print()





/*
 ### *Question 2:*
 Question 2:
 Create a `Student` class with properties for `name` (String) and `grades` (a dictionary where the keys are subject names and the values are cases from the `Grade` enumeration). Define the `Grade` enumeration with cases `.A(Double)`, `.B(Double)`, `.C(Double)`, `.D(Double)`, and `.F(Double)`, where each case holds an associated GPA value. Implement a computed property `gpa` that calculates the average GPA from the values in the `grades` dictionary. Also, create a method `addGrade(subject: String, grade: Grade)` to add grades for subjects, and a closure-based method `filterSubjects(_ condition: (Grade) -> Bool)` to return subjects that meet a specific condition. In addition, create a subclass `ScholarshipStudent` that inherits from `Student` and adds a `scholarshipAmount` property. Include an initializer and deinitializer for `ScholarshipStudent` to handle the setup and teardown of the object. Demonstrate the use of optional chaining to safely access a grade value and show type casting by checking if an instance of `Student` is actually of type `ScholarshipStudent`.
 */

enum Grade {
    
    case A(Double)
    case B(Double)
    case C(Double)
    case D(Double)
    case F(Double)
    
    // make function to get a associated value
//    var getValue: Double {
//
//        switch self {
//            case .A(let value):
//                return value
//
//            case .B(let value):
//                return value
//
//            case .C(let value):
//                return value
//
//            case .D(let value):
//                return value
//
//            case .F(let value):
//                return value
//        }
//    }
    
    func getValue() -> Double {
        
        switch self {
            
            case .A(let value):
                return value
                
            case .B(let value):
                return value
                
            case .C(let value):
                return value
                
            case .D(let value):
                return value
                
            case .F(let value):
                return value
            
        }
    }
}

class Student {
    
    var name: String
    var grades: [String: Grade]
    
    init(name: String){
        
        self.name = name
        self.grades = [:]
    }
    
    var gpa: Double {
        
        var totalGpa = 0.0
        
        for ( _, grade) in grades {
            
            totalGpa += grade.getValue()
        }
        
        return grades.isEmpty ? 0.0 : totalGpa / Double(grades.count)
    }
    
    func addGrade(subject: String, grade: Grade) {
        
        grades[subject] = grade
        print("\(subject) added successfully!")
    }
    
    func filterSubjects(_ condition: (Grade) -> Bool) -> [String]{
        
     // return grades.filter { condition( $0.value) }.map{ $0.key }
        var filteredSubjects: [String] = []
        
        for (subject, grade) in grades {
            
            if condition(grade) {
                filteredSubjects.append(subject)
            }
        }
        
        return filteredSubjects
    }
    
}

class ScholarshipStudent: Student {
    
    var scholarshipAmount: Int
    
    init(name: String, scholarshipAmount: Int) {
        
        self.scholarshipAmount = scholarshipAmount
        super.init(name: name)
    }
    
    deinit {
        print("\(name)'s Scholarship is removed from memory")
    }
}

let stu1 = Student(name: "mohd")
stu1.addGrade(subject: "math", grade: .A(90))
stu1.addGrade(subject: "Phys", grade: .B(88))
stu1.addGrade(subject: "Bio", grade: .B(88))
stu1.addGrade(subject: "English", grade: .C(70))
stu1.addGrade(subject: "Hindi", grade: .F(40))

print()
print("Total GPA: \(stu1.gpa)")
print()

//var filtersubject = stu1.filterSubjects(){ $0.getValue < 70 }
let filtersubject = stu1.filterSubjects { grade in
    return grade.getValue() < 70
}
print(filtersubject)

print()

// optional chaining to access a grade value
if let mathGrade = stu1.grades["math"]?.getValue {
    
    print("Math grade: \(mathGrade)")
} else {
    print("math grade is not found")
}

print()
var scholar = ScholarshipStudent(name: "daniyal", scholarshipAmount: 50000)

// type-casting
if let temp = stu1 as? ScholarshipStudent {
    
    print("\(temp.name) is type of ScholarshipStudent")
} else {
    
    print("Object is not a type of ScholarshipStudent")
}


/*
 Question 3:
 Create a `Product` structure with properties for `name` (String), `price` (Double), and `category` (of type `ProductCategory` enum). Define the `ProductCategory` enumeration with cases such as `electronics`, `furniture`, and `grocery`. Then, implement a `ShoppingCart` class with a `products` array that stores `Product` objects. Include a method `addProduct(product: Product)` to add products to the cart, a computed property `totalCost` that calculates the sum of the prices of all products in the cart, and a method `filterProducts(by: (Product) -> Bool)` that filters products based on a closure. Additionally, implement a method `applyDiscount(_ discount: Double)` using control flow to apply a discount, ensuring its validity. Use type casting (`as?`) to check whether a `Product` belongs to a specific category before applying a special discount. Finally, demonstrate optional chaining by safely accessing the category of a product in a method.

 */

enum ProductCategory {
    
    case electronics
    case clothing
    case groceries
}

struct Product {
    
    var name: String
    var price: Double
    var category: ProductCategory
}

class ShoppingCart {
    
    var products: [Product]
    
    var totalCost: Double {
        
        var totalPrice = 0.0
        for item in products {
            totalPrice += item.price
        }
        
        return totalPrice
    }
    
    func addProduct(product: Product) {
        
        products.append(product)
        print("\(product.name) is added successfully!")
    }
    
    func filterProducts(by: (Product) -> Bool) -> [Product] {
        
        return products.filter(by)
    }
    
    
    
    func applyDiscount(_ discount: Double, to category: ProductCategory) {
        
        if discount < 0 || discount > 100 {
            
            print("\(discount) is Not a valid discount!")
            return
        }
        
        var totalDiscount = 0.0
        
        for item in products {
            var discountAmount = 0.0
            
            if let _ = item as? Product {
                
                if item.category == .electronics {

                    discountAmount = item.price * (discount / 100)
                }
            }
            
            totalDiscount += discountAmount
        }
        
        let finalAmount = totalCost - totalDiscount
        
        print("""
             Your total bill before discount: \(totalCost)
             Discount applied on \(category): \(discount)%
             Total Discount Amount: \(totalDiscount)
             Bill after discount: \(finalAmount)
            """)
    }
    
    func printCategory(product: Product?) {
        
        if let category = product?.category {
            print("Product category is \(category) ")
        }else {
            print("Product category is not found!")
        }
    }
    
    init(){
        
        self.products = []
    }
}




let laptop = Product(name: "Hp Laptop", price: 450000, category: .electronics)
let tv = Product(name: "MG tv", price: 20000, category: .electronics)
let apple = Product(name: "apple", price: 100, category: .groceries)
let shirt = Product(name: "shirt", price: 1000, category: .clothing)


let myshopcard = ShoppingCart()
myshopcard.addProduct(product: laptop)
myshopcard.addProduct(product: tv)
myshopcard.addProduct(product: apple)
myshopcard.addProduct(product: shirt)
print()

var filterproducts = myshopcard.filterProducts(){
    
    (product : Product) -> Bool in
    return product.category == .electronics
}

for item in filterproducts {
    print(item.name)
}

print()
myshopcard.applyDiscount(100, to: .electronics)
print()
myshopcard.printCategory(product: tv)






