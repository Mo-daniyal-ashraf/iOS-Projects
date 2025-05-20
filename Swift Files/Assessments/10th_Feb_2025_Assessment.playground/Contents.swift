

/*
 1. Create a `Book` class with properties `title`, `author`, and `isAvailable` (default: `true`), and a method `borrowBook()` that sets `isAvailable` to `false`. Then, define a `Library` structure with a `books` property (an array of dictionaries, each containing a book's `title` and `availability status`), a method `addBook(_ book: Book)` to add books, a method `borrowBook(title: String)` that checks availability before borrowing using control flow, a computed property `availableBooks` returning all available books, and a closure inside `borrowBook(title:)` to print whether borrowing was successful.
 */

class Book {
    var title: String
    var author: String
    var isAvailable: Bool = true
    
    func borrowBook(){
        self.isAvailable = false
    }
    init(title: String, author: String){
        self.title = title
        self.author = author
    }
}

class Library {
    var books : [String:Bool] = [:]
    
    var availableBooks: Void {
        
        print("Here are all avaliable books :")
        for book in books{
            if book.value {
                print(book.key)
            }
        }
    }
    
    
    func addBook(_ book : Book){
        books[book.title] = true
    }
    
    func borrowBook(title: String) -> () -> String {
        var isborrowsuccess = false
        
        if books[title] != nil && books[title] == true{
            books[title] = false
            isborrowsuccess = true
        }
        
        return isborrowsuccess == true ? {"\(title) borrow success!"} : {"\(title) borrow not success!"}
    }
    
}

var book1 = Book(title: "Macbeth", author: "William Shakespeare")
var book2 = Book(title: "The Merchant of Venice", author: "William Shakespeare")
var book3 = Book(title: "Mein Kamph", author: "Adolf Hitler")
var book4 = Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald")

var lib = Library()
lib.addBook(book1)
lib.addBook(book2)
lib.addBook(book3)
lib.addBook(book4)
lib.availableBooks

print()
print(lib.borrowBook(title: "Macbeth")())
print(lib.borrowBook(title: "Macbeth")())
print()
print()


/*
 2. Create a `Student` class with properties `name` and `grades` (a dictionary where keys are subject names and values are `Grade` enum cases), a computed property `gpa` that calculates the average GPA, a method `addGrade(subject: String, grade: Grade)` to add grades, and a closure-based method `filterSubjects(_ condition: (Grade) -> Bool)` that returns subjects satisfying a given condition; define a `Grade` enumeration with cases `.A(Double)`, `.B(Double)`, `.C(Double)`, `.D(Double)`, and `.F(Double)`, where each case has an associated GPA value.
 Define an enumeration Grade with cases .A, .B, .C, .D, and .F. Each case should have an associated value representing the GPA.

 Create a class Student with properties name, grades (a dictionary with subject names as keys and Grade as values), and a computed property gpa that calculates the average GPA of all subjects.

 Implement:

 A method addGrade(subject: String, grade: Grade) to store a new grade.
 A closure-based method filterSubjects that takes a closure and returns subjects that satisfy a given condition (e.g., subjects with a grade of .A or .B).

 more define hai isse samjha nhi aye to baat krte hai
 */

enum Grade {
    case A
    case B
    case C
    case D
    case E
}

class Student {
    
    var name: String
    var grades: [String:Grade] = [:] // [subname : grade]
    
    
    func addGrade(subject: String, grade: Grade) {
        grades[subject] = grade
    }
    
    func filterSubjects(gradeToMatch: Grade) -> [String] {
        var filteredSubjects: [String] = []
        
        
        for (subject, grade) in grades {
            if case gradeToMatch = grade {
                filteredSubjects.append(subject)
            }
        }
        
        return filteredSubjects
    }
    
    init(name : String){
        self.name = name
    }
}


let krishan = Student(name: "krishan")
krishan.addGrade(subject: "maths", grade: .C)
krishan.addGrade(subject: "Bio", grade: .A)
krishan.addGrade(subject: "Phy", grade: .D)
krishan.addGrade(subject: "Hindi", grade: .A)
krishan.addGrade(subject: "Urdu", grade: .B)
krishan.addGrade(subject: "English", grade: .C)

var filterSub = krishan.filterSubjects(gradeToMatch: .B)

for i in filterSub {
    print(i)
}
print()

/*
 3. Create a `Product` structure with properties `name`, `price`, and `category` (of type `ProductCategory` enum); define a `ProductCategory` enumeration with cases `electronics`, `clothing`, and `groceries`; implement a `ShoppingCart` class with a `products` array, a method `addProduct( product: Product)` to add products, a computed property `totalCost` that calculates the sum of product prices, a method `filterProducts(by: (Product) -> Bool)` that returns filtered products using a closure, and a method `applyDiscount( discount: Double)` that applies a discount using control flow to ensure validity.
 */


enum ProductCategory {
    case electronics
    case clothing
    case groceries
}

struct Product {
    var name: String
    var price: Double
    var ProductCategory: ProductCategory
}

class ShoppingCart {
    var products: [Product] = []
    
    func addProduct(product: Product) {
        products.append(product)
    }
    
    var totalCost : Double {
        var totalprice = 0.0
        for item in products {
            totalprice += item.price
        }
        return totalprice
    }
    
    
    func filterProducts( condition : (Product) -> Bool) -> [Product] {
        return products.filter(condition)
    }
    
    func applyDiscount(discount : Double) {
        if discount < 0 || discount > 100 {
            print("Invalid discount!")
            return
        }
        
        let discountamount = totalCost * (discount / 100)
        let finalammount = totalCost - discountamount
        
        print("After adding discount of \(discount) your total bill is: \(finalammount)")
    }
}

let laptop = Product(name: "Mi Laptop", price: 450000, ProductCategory: .electronics)
let tv = Product(name: "MG tv", price: 20000, ProductCategory: .electronics)
let apple = Product(name: "apple", price: 100, ProductCategory: .groceries)
let shirt = Product(name: "shirt", price: 1000, ProductCategory: .clothing)


let shopcard = ShoppingCart()
shopcard.addProduct(product: laptop)
shopcard.addProduct(product: tv)
shopcard.addProduct(product: apple)
shopcard.addProduct(product: shirt)

var filterproduct = shopcard.filterProducts(){
    (prod : Product) -> Bool in
    return prod.ProductCategory == .groceries
}

for item in filterproduct {
    print(item.name)
}

shopcard.applyDiscount(discount: 100)

