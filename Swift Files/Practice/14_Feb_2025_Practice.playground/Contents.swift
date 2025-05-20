import UIKit






//Delegation

//Delegates are a design pattern that allows one object to send messages to another object when a specific event happens.




protocol TransactionDelegate {
    func transactionDidComplete(amount: Double)
}

class Bank {
    var delegate: TransactionDelegate?

    func processTrabsaction(amount: Double) {
        print("rocessing transaction of \(amount).")
        delegate?.transactionDidComplete(amount: amount)
    }

    init(delegate: TransactionDelegate){
        self.delegate = delegate
    }
}


class AccountHolder: TransactionDelegate {
    var balance: Double = 25000.0
    var delegate: GiveBankRecipt?

    func transactionDidComplete(amount: Double) {
        balance += amount
        print("transaction completed updated balence \(balance)")
        delegate?.printRecipt(amount: amount)
    }

    init(delegate: GiveBankRecipt) {
        self.delegate = delegate
    }
}

class GiveBankRecipt {
    func printRecipt(amount: Double) {
        print("you added \(amount) to your account")
    }
}

let bob = Bank(delegate: AccountHolder(delegate: GiveBankRecipt()))
bob.processTrabsaction(amount: 1400)



//protocol DeveloperProtocolDelegate {
//
//}
//
//class Developer {
//
//    var manager: Manager?
//
//    func addingTwoNum(_ x: Int, _ b: Int){
//        let res = x + b
//        manager?.printres(res:res)
//    }
//
//}
//
//class Manager {
//
//    var developer: Developer?
//    var leadRef: Lead
//    func processAdding(a : Int, b: Int){
//        developer?.addingTwoNum(a,b)
//    }
//
//    func printres(res: Int){
//        leadRef.printResForClient(res: res)
//    }
//
//    init(developer: Developer, leadRef: Lead){
//        self.leadRef = leadRef
//        self.developer = developer
//        self.developer?.manager = self
//
//    }
//}
//
//class Lead {
//    func printResForClient(res: Int){
//        print("Here is result of the taks: \(res)")
//    }
//}
//
//print()
//let lead = Lead()
//let developer = Developer()
//let m = Manager(developer: Developer(),leadRef: Lead())
//m.processAdding(a: 12, b: 10)
//
//
//

protocol DeveloperDelegate {
    func didFinishAdding(res: Int)
}

class Developer {

    var managerRef: DeveloperDelegate?

    func developerWillAdd(a: Int, b: Int){
        let res = a + b
        managerRef?.didFinishAdding(res: res)
    }
}
class Manager: DeveloperDelegate {
    var developer: Developer?


    func didFinishAdding(res: Int){
        print("Added ans: \(res)")
    }

    func addTwoNumber(a: Int, b: Int){
        developer?.developerWillAdd(a: a, b: b)
    }

    init(developer: Developer){
        self.developer = developer
        self.developer?.managerRef = self
    }

}

print()
let developer = Developer()

let objm = Manager(developer: developer)
objm.addTwoNumber(a: 10, b: 200)

class TVShow{
    var name: String
    init(name: String) {
        self.name = name
    }
    func play(){
        print("Tvshow playing")
    }
}


class Movie: TVShow{
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
    override func play(){
        print("movie playing")
    }
}

class TalkShow: TVShow{
    var host: String
    init(name: String, host: String) {
        self.host = host
        super.init(name: name)
    }
    override func play(){
        print("talkshow playing")
    }
}

let theBucketList = Movie(name: "The Bucket List", director: "Rob Reiner")
let interstellar = Movie(name: "Interstellar", director: "Christopher Nolan")
let theTonightShow = TalkShow(name: "The Tonight Show Starring Jimmy Fallon", host: "Jimmy Fallon")


let tvSchedule = [theBucketList, interstellar, theTonightShow]
var temp = theBucketList as TVShow
temp.play()


func printall(_ a : inout [Int]) {
    a.append(10000)
    for i in a {
        print(i)
    }
}

var a = [1,2,3,4,5]
printall(&a)

func greet(morning: Bool, name:  () -> String) {
    print(1)
    if morning {
        print("Good morning \(name())")
    }
}

func getname(name: String) -> String {
    print(2)
    return name
}

print()
greet(morning: false) { () -> String in
    getname(name: "arev")
}



