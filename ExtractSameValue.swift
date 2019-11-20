//To quickly compare arrays and extract the same value using the higher order function | Swift 4

let snacksDishListOne = ["Kachori", "Samosa", 
                         "Dhokla", "Khakhra", "Idly"]

let snacksDishListSecond = ["Khandvi", "Handvo", 
                            "Samosa", "Dosa", "Kachori"]

let sameSnackItems = snacksDishListOne.filter{snacksDishListSecond.contains($0)}

print("Same snack Items: \(sameSnackItems)")
//Same snacks Item: ["Kachori", "Samosa"]
