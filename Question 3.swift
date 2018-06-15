
/*
 Question 3 -- changePossibilities(amount,amount): Your quirky boss collects rare, old coins. They found out you're a programmer and asked you to solve something they've been wondering for a long time.
 
 Write a function that, given an amount of money and an array of coin denominations, computes the number of ways to make the amount of money with coins of the available denominations.
 
 Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations:
 
 1¢, 1¢, 1¢, 1¢
 1¢, 1¢, 2¢
 1¢, 3¢
 2¢, 2¢
 */

//**All questions are answered in Swift 3.0 because my computer doesn't have enough memory to upgrade to Mac OS High Sierra. As a result, the newest XCode wasn't installed to support Swift 4.0

func q3changePossibilities2(amount:Int, denominations:[Int], currentIndex: Int = 0, count:Int = 0, isForOriginalAmount:Bool = true) -> Int {
    //This is the base case of a recursive function.
    //If the currentIndex is greater than the number of denominations.count - 1, return 0
    if currentIndex > denominations.count - 1 {
        return 0
    }
    //Create the variable of count named localCount
    var localCount = count
    
    //Get the current denomination value
    let currentDenominationValue = denominations[currentIndex]
    
    //Checking if the amount is the original input because this avoid duplicate counts, base on the example, this will be 4
    if isForOriginalAmount {
        //Check if the current denomination is equal or less than the amount
        if currentDenominationValue <= amount{
            
            //If the remainder is zero when the amount is divisible by currentDenominationValue.
            //This also increments when the currentDenominationValue is equal to 1
            if amount % currentDenominationValue == 0 {
                localCount = localCount + 1
            }
            
            //Get the difference
            let amountDiff = amount - currentDenominationValue
            
            //Check if the difference is less than or equal to the currentDenominationValue, and the currentDonominationValue is not equal to 1 (the case when currentDenominationValue of 1 is already taken care of)
            if amountDiff <= currentDenominationValue && currentDenominationValue != 1 {
                
                //Get additional count recursively
                let additionCount = q3changePossibilities2(amount: amountDiff, denominations: denominations, isForOriginalAmount: false)
                
                //Add the additional count to the local count
                localCount = localCount + additionCount
            }
        }
    } else {
        //Check if the current denomination is less than the amount
        if currentDenominationValue < amount{
            
            //If the remainder is zero when the amount is divisible by currentDenominationValue.
            //This also increments when the current DenominationValue is equal to 1
            if amount % currentDenominationValue == 0 {
                localCount = localCount + 1
            }
            
            //Get the difference
            let amountDiff = amount - currentDenominationValue
            
            //Check if the difference is less than or equal to the currentDenominationValue, and the currentDonominationValue is not equal to 1 (the case when currentDenominationValue of 1 is already taken care of)
            if amountDiff <= currentDenominationValue && currentDenominationValue != 1 {
                
                //Get additional count recursively
                let additionCount = q3changePossibilities2(amount: amountDiff, denominations: denominations, currentIndex: 0, count: 0, isForOriginalAmount: false)
                
                //Add the additional count to the local count
                localCount = localCount + additionCount
            }
        }
    }
    //Get the sum of all ways available
    return localCount + q3changePossibilities2(amount:amount, denominations:denominations, currentIndex: currentIndex + 1)
}

//For improving this, the code for the recursive call can be reduced

let result5 = q3changePossibilities2(amount: 4, denominations: [1,2,3])
print("\(result5) should be equal to 4")
