//Higher order functions in Swift 4
//Higher order functions are functions that can accept other function or closure as parameters.
//Those functions are Map, Filter, Reduce, Sorted, CompactMap, Chaining, Contains. Another new higher order functions were introduced in swift 4.2. Those functions are AllSatisfy, FirstIndex, LastIndex and RemoveAll.

//Map:
//Map function can be used to loop over a collection and apply the same operation to each element in the collection.
//Let’s assume we need to convert each random celsius to fahrenheit values
//In these examples above map accepted a closure as an argument and returned the result in the new array that contains fahrenheit values.

let celciusArray = [-10.0, -2.0, 10.0, 56.0, 87.0, 100.0]
let fahrenheitArray = celciusArray.map { $0 * (9/5) + 32 }
print(fahrenheitArray) 
//Output: [14.0, 28.4, 50.0, 132.8, 188.6, 212.0]

//Another example using an array of strings,
let stringArray = ["Egypt", "Ghana", "Haiti", "India", "Italy"]
let uppercasedStringArray = stringArray.map {$0.uppercased()}
print(uppercasedStringArray)
//Output: ["EGYPT", "GHANA", "HAITI", "INDIA", "ITALY"]

//------------------------------------------------------------------------------------------------

//CompactMap:
//CompactMap function returns an array containing the non-nil results of calling the given transformation with each element of this sequence.

let possibleNumbers = ["1", "2", "three", "///4///", "5"]
let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
print(compactMapped)
//Output:  [1, 2, 5]
//If used map on possibleNumbers the result would be [1, 2, nil, nil, 5] but because we are using compactMap so the result is [1, 2, 5].

//------------------------------------------------------------------------------------------------

//Filter:
//Filter function returns an array containing, in order, the elements of the sequence that satisfy the given predicate.

let stringArray = ["Khandvi", "Samosa", "Dhokla", "Khakhra","Handvo", "Idli"]
let filteredArray = stringArray.filter { $0.count <= 6 }
print(filteredArray)
//Output: ["Samosa", "Dhokla", "Handvo", "Idli"]
//In this example, filter is used to include only names shorter than or equal to six characters.

//------------------------------------------------------------------------------------------------

//Reduce:
//Reduce function is used to combine all items in a collection to create a single new value. The reduce method takes two values, an initial value and a combine closure.

let numbers = [1, 2, 3, 4]
let numberSum = numbers.reduce(0, { x, y in
    x + y
})
print(numberSum)
//Output: 10

//When numbers.reduce is called, the following steps occur,
//- The next partial result closure is called with initialResult 0 in this case and the first element of numbers, returning the sum: 1.
//- The closure is called again repeatedly with the previous call’s return value and each element of the sequence.
//- When the sequence is exhausted, the last value returned from the closure is returned to the caller.

//------------------------------------------------------------------------------------------------

//Sorted:
//Sorted function returns the elements of the sequence, sorted.
//Here’s an example of sorting a string array. Strings in Swift conform to the Comparable protocol, so strings are sorted in ascending order according to the less-than operator.

let stringArray = ["Egypt", "Ghana", "Haiti", "India", "Italy"]
let sortedArray = stringArray.sorted()
print(sortedArray)
//Output: ["Egypt", "Ghana", "Haiti", "India", "Italy"]

//To sort the elements of your sequence in descending order, pass the greater-than operator to the sorted(by:) method.
let sortedArray = stringArray.sorted(by: >)
print(sortedArray)
//Output: ["Italy", "India", "Haiti", "Ghana", "Egypt"]

//------------------------------------------------------------------------------------------------

//Chaining:
//Chaining is the ability to combine all those higher order functions. Let’s filter out names that start with “A”, make them uppercase and then sort them.

let stringArray = ["North America", "South America", "Antarctica", "Europe", "Asia", "Africa", "Australia"]
let result = stringArray.filter{$0.first == "A"}.map{$0.uppercased()}.sorted()
print(result)
//Output: ["AFRICA", "ANTARCTICA", "ASIA", "AUSTRALIA"]

//------------------------------------------------------------------------------------------------

//Contains:
//Contains function returns a boolean value indicating whether the sequence contains an element that satisfies the given predicate.
//This example checks to see whether a string is in a stringArray.

let stringArray = ["Egypt", "Ghana", "Haiti", "India", "Italy"]
print(stringArray.contains("Haiti"))
//Output: "true"
print(stringArray.contains("China"))
//Output: "false"

//------------------------------------------------------------------------------------------------

//Below is a new collection of higher order functions introduced in swift 4.2:

//AllSatisfy:
//AllSatisfy function returns a boolean value indicating whether every element of a sequence satisfies a given predicate.
//The following code uses this method to test whether all the names in an array have at least five characters:
let names = ["Egypt", "Ghana", "Haiti", "India", "Italy"]
let allHaveAtLeastFive = names.allSatisfy({ $0.count >= 5 })
print(allHaveAtLeastFive)
//Output: true

//------------------------------------------------------------------------------------------------

//FirstIndex and LastIndex:
//FirstIndex(where:) and firstIndex(of:) that return the first index where the specified value appears in the collection. We have also lastIndex(of:) and lastIndex(where:) that returns the last index in which an element of the collection satisfies the given predicate.
//This example shows how you can modify one of the name in an array of names.

var names = ["Egypt", "Ghana", "Haiti", "India", "Italy"]
if let i = names.firstIndex(of: "Ghana") {
  names[i] = "China"
}
print(names)
//Output: ["Egypt", "China", "Haiti", "India", "Italy"]

//You can use the predicate to find an element of a type that doesn’t conform to the equatable protocol or to find an element that matches particular criteria. Here’s an example that finds a name that begins with the letter “G”,
if let i = names.firstIndex(where: { $0.hasPrefix("G") }) {
  print("\(names[i]) starts with 'G'")
}
//Output: Ghana starts with 'G'

//------------------------------------------------------------------------------------------------

//RemoveAll:
//Now we have a new method removeAll(where:) that removes all the elements that satisfy the given predicate.
//Use this method to remove every element in a collection that meets particular criteria. This example removes all the odd values from an array of numbers,

var numbers = [5, 6, 7, 8, 9, 10, 11]
numbers.removeAll(where: { $0 % 2 == 1 })
print(numbers)
//Output: [6, 8, 10]

