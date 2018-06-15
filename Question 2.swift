
/*
 Question 2 -- decodeString(s): Given an encoded string, return its corresponding decoded string.
 
 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is repeated exactly k times. Note: k is guaranteed to be a positive integer.
 
 For s = "4[ab]", the output should be decodeString(s) = "abababab"
 For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"
 */

//**All questions are answered in Swift 3.0 because my computer doesn't have enough memory to upgrade to Mac OS High Sierra. As a result, the newest XCode wasn't installed to support Swift 4.0
func q2decodeString2(_ s:String) -> String {
    //Create a mutable copy of String "s" and name it stringToReturn, stringToReturn changes in the while loop
    var stringToReturn = s
    //Capture the repeating sequence
    var repeatString = ""
    
    //Create varaible "c" for incrementing
    var c: Int = 0
    //Get characters count of stringToReturn
    var maxCharactersCount = stringToReturn.characters.count
    //The array that stores the indexes
    var openBracketIndexArray: [String.Index] = []
    
    //While the increment "c" is less than the characters count of stringToReturn
    while c < maxCharactersCount {
        //Get the current Index of the string
        let currentCharacterIndex = stringToReturn.index(stringToReturn.startIndex, offsetBy: c)
        
        //When the character is "[", store the index in the array and increment "c" by 1
        if stringToReturn[currentCharacterIndex] == "[" {
            openBracketIndexArray.append(currentCharacterIndex)
            c += 1
            
            //When the character is "]", check if last open bracket index is available
        } else if stringToReturn[currentCharacterIndex] == "]" {
            if let openBracketIndex = openBracketIndexArray.last {
                let closeBracketIndex = currentCharacterIndex
                
                //Get the repeating string
                let repeatingStringStartIndex = s.index(openBracketIndex, offsetBy: 1)
                let repeatingStringEndIndex = s.index(closeBracketIndex,offsetBy:-1)
                repeatString = stringToReturn[repeatingStringStartIndex...repeatingStringEndIndex]
                
                //Get the number in the type Int
                let numberIndex = stringToReturn.index(openBracketIndex, offsetBy: -1)
                let numberString = String(stringToReturn[numberIndex])
                if let validNuberOfRepeats = Int(numberString) {
                    //Call helper functions to get new string with repeats
                    let newString = q2helperFunction2(validNuberOfRepeats, repeatString)
                    //Get the range of string that needs to be replaced by newString
                    let rangeToReplace = numberIndex...closeBracketIndex
                    //replace stringToReturn's subrange with newString
                    stringToReturn.replaceSubrange(rangeToReplace, with: newString)
                }
            }
            
            //Reset the increment, openBracketIndexArray, and get new maxCharactersCountValue
            c = 0
            openBracketIndexArray = []
            maxCharactersCount = stringToReturn.characters.count
            
            //If the charater is neither "[" nor "]", increment c by 1
        } else {
            c += 1
        }
        
        //Safty check: if the stringToReturn doesn't have "[" and  "]", setting "c" to be equal maxCharactersCount will exit the while loop
        if !stringToReturn.contains("[") && !stringToReturn.contains("]") {
            c = maxCharactersCount
        }
        //Loops again until the increment "c" is not less than maxCharactersCount
    }
    //return string
    return stringToReturn
}

//This is a helper function that creates the repeated string
func q2helperFunction2(_ int: Int, _ string: String) -> String {
    var stringToReturn = ""
    for _ in 0..<int {
        stringToReturn = stringToReturn + string
    }
    return stringToReturn
}

//For improving this
//A recursive call may work by the following,
//1. Create the array that stores the indexes
//2. If the increment "c" is not less than maxCharactersCount, exit the loop
//3. If the character is "[", store the index in the array
//4. If the character is "]", call function recursively
//5.Return String


let result3 = q2decodeString2("4[ab]")
print("\(result3) should be equal to abababab")

let result4 = q2decodeString2("2[b3[a]]")
print("\(result4) should be equal to baaabaaa")

