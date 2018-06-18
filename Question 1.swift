
/*
 The questions in this section test your general programming knowledge. You must solve all of these questions with basic programming constructs. You may not use any large libraries or frameworks to solve these questions.
 
 You may use the Internet to conduct research as you would at a job to solve any or these problems: if you need help to figure out the approach to a problem, feel free to find resources that help you to understand how to approach these types of programs generally, but you may NOT copy others' code. The solutions you provide here must be your own work.
 
 Please upload the answers to each of the questions below into your Github repo and provide us with that link. Put each answer in its own file, with the title being the number of the question, and paste the link to your repo in the textbox below.
 
 You may use any language you'd like to complete these questions, but be sure to choose just one.
 *******************************************************
 Question 1 -- sortByStrings(s,t): Sort the letters in the string s by the order they occur in the string t. You can assume t will not have repetitive characters. For s = "weather" and t = "therapyw", the output should be sortByString(s, t) = "theeraw". For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg".
 */

//**All questions are answered in Swift 3.0 because my computer doesn't have enough memory to upgrade to Mac OS High Sierra. As a result, the newest XCode wasn't installed to support Swift 4.0

//String "t" contains the ideal character order, while String "s" contains the characters to be ordered
func sortByStrings(_ s:String, _ t: String) -> String{
    var stringToReturn = ""
    //Loop through t's character
    for chart in t.characters {
        //Loop through s's character
        for chars in s.characters {
            //When the characters are equal, add it to the stringToReturn
            if chart == chars {
                stringToReturn = stringToReturn + "\(chart)"
            }
        }
    }
    //return stringToReturn
    return stringToReturn
}


let result1 = sortByStrings("good", "odg")
print("\(result1) should be equal to oodg")

let result2 = sortByStrings("weather", "therapyw")
print("\(result2) should be equal to theeraw")
