// Last day left question
/*
3. Write a function commonCharactersInStringswhich contains no argument label while calling and takes array of strings as input, this function:
a. Uses a nested helper function to clean up each string (remove spaces and lowercase the characters).
b. Finds and returns the common characters present in all strings using Set operations.
c. Return a Set of Characters

Example:
Input: ["Swift is Fun", "Swift and Fast", "Swift Coding"]
Output: ["s", "t", "i", "f", "w"] (set order may vary)
 */

func commonCharactersInStringswhich(arrayOfStrings:[String]) -> Set<Character>{
    // Cleanup function for lowercase and removing spaces
    func cleanUp(arrayOfStrings:[String])-> [String]{
        var newStr: [String] = []
        for str in arrayOfStrings{
            var tempstr = ""
            for ch in str{
                if ch != " "{
                    tempstr.append(ch)
                }
            }
            tempstr = tempstr.lowercased()
            newStr.append(tempstr)
        }
        return newStr
    }

    // Find the common characters in all strings
    let newstr = cleanUp(arrayOfStrings:arrayOfStrings)
    var setA: Set<Character> = Set(newstr[0])

    for i in 1..<newstr.count{
        let setB: Set<Character> = Set(newstr[i])
        setA = setA.intersection(setB)
    }

    return setA
}

var ans: Set<Character> = commonCharactersInStringswhich(arrayOfStrings:["Swift is Fun", "Swift and Fast", "Swift Coding"])
print(ans)
print()



/*
1. Write a function that takes an array of integers and a closure as parameters. The closure should determine whether each integer in the array is even or odd, and the function should return an array containing the result of applying the closure to each integer..
*/

func resultArray(numbers : [Int], oddOrEven : ([Int]) -> [Int:String]) -> [Int:String]{
//    var ansDict: [Int:String] = [:]
    
//    for num in number{
//        if oddOrEven(num){
//            ansDict[num] = "Even"
//        }else{
//            ansDict[num] = "Odd"
//        }
//        ansDict[num] = oddOrEven(num)
//    }
    
    var ansDict = oddOrEven(numbers)
    return ansDict
}

//var helperClosure : (Int) -> Bool = { $0 % 2 == 0}
//var helperClosure : (Int) -> String = { $0 % 2 == 0 ? "Even" : "Odd"}

var helperClosure : ([Int]) -> [Int:String] = {
    (integersOfArray) in
    
    var ansDict: [Int:String] = [:]
    for num in integersOfArray{
        ansDict[num] = num % 2 == 0 ? "Even" : "Odd"
    }
    return ansDict
}

var ansArray = resultArray(numbers: [1,2,3,4], oddOrEven: helperClosure)
print(ansArray)
print()





/*
 2. Implement a higher-order function called applyOperation that takes two integers and a closure as parameters. The closure should represent a mathematical operation (e.g., addition, subtraction, multiplication, division), and the function should apply the operation to the two integers and return the result
 */

func applyOperation(_ a : Int, _ b : Int, doTask : (Int,Int) -> Int) -> Int {
    return doTask(a,b)
}
var addClosure : (Int,Int) -> Int = {
    (a,b) in
    return a + b
}
var additionResult = applyOperation(12, 10, doTask : addClosure)
print(additionResult)

var subtractClosure : (Int,Int) -> Int = {$0 - $1}
var subtractionResult = applyOperation(15, 10, doTask : subtractClosure)
print(subtractionResult)

var multiplyClosure : (Int,Int) -> Int = {$0 * $1}
var multiplicationResult = applyOperation(5, 3, doTask : multiplyClosure)
print(multiplicationResult)

var divideClosure : (Int,Int) -> Int = {$0 / $1}
var divisionResult = applyOperation(12, 6, doTask : divideClosure)
print(divisionResult)

    

