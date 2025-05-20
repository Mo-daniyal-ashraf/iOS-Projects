

//1. Write a function transformAndAnalyze which contains no argument label while calling and takes string as input, this function:
//a. Splits the input text into words (separated by spaces).
//b. Removes punctuation and converts everything to lowercase.
//c. Returns a list of unique words, the longest word, and a dictionary of word frequencies.
//
//Example:
//Input: "Swift is great! Swift is fun!"
//Output: (["swift", "is", "great", "fun"], "great", ["swift": 2, "is": 2, "great": 1, "fun": 1])

func transformAndAnalyze(text:String) -> (uniqueWord:Set<String>,longestWord:String,freqWord:[String:Int]){
    
    var textToStringArray: [String] = []
    var longestWord = ""
    var wordFreq: [String:Int] = [:]
    var currStr = ""
    for ch in text{
        if(ch != "!" && ch != " "){
            currStr.append(ch)
        }else if(ch == " "){
            currStr.lowercased()
            textToStringArray.append(currStr)
            currStr = ""
        }
    }
    textToStringArray.append(currStr)
    var uniqueWords: Set<String> = []
    var currlen = 0
    for str in textToStringArray {
        if(str.count > currlen){
            currlen = str.count
            longestWord = str
        }
        wordFreq[str,default: 0] += 1
        uniqueWords.insert(str)
    }
    return (uniqueWords, longestWord, wordFreq)
}

var ansTuple = transformAndAnalyze(text:"Swift is great! Swift is fun!")
print(ansTuple.0)
print(ansTuple.1)
print(ansTuple.2)
print()


//2. Create a function filterAndSortNumbers which contains no argument label for the parameter array of Integers and accepts a function type ([Int], Int) -> Bool as input, this function:
//a. Filters the input array based function passed (The passed function will filter the values and return only the greater values)
//b. Sorts the result in ascending order.
//c. Returns the filtered and sorted list.
//
//Example:
//Input: [12, 5, 8, 130, 44] with filter value 10
//Output: [12, 44, 130]



func filterfunc(number: Int, filterValue: Int) -> Bool {
    return number > filterValue
}

func filterAndSortNumbers(numbers: [Int], filterValue: Int, filterfunc: (Int, Int) -> Bool) -> [Int] {
    var ansArray: [Int] = []
    
    for ele in numbers {
        if filterfunc(ele, filterValue) {
            ansArray.append(ele)
        }
    }
    
    ansArray.sort()
    return ansArray
    
}


let numbers = [12, 5, 8, 130, 44]
let result = filterAndSortNumbers(numbers: numbers, filterValue: 10, filterfunc: filterfunc)
print(result)
print()



