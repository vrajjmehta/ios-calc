//
//  ViewController.swift
//  Calculator
//
//  Created by Vraj Mehta on 09/04/2020
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOutputLabel: UILabel!      // define display label variable
    
    var userInput: String = ""                          // userInput string to be used for calculations
    var userDisplayInput: String = ""                   // userDisplayInput string to be used for to display user inputs on label
    
    override func viewDidLoad() {                       // declare display label as 0 when app loads
        super.viewDidLoad()
        numberOutputLabel.text = "0"
    }
    
    @IBAction func numberPressedButton(_ sender: roundButton) { //func to handle when user clicks any number button
        userInput += "\(sender.tag)"                    // append the numbers to userInput & userDisplayInput string
        userDisplayInput += "\(sender.tag)"
        numberOutputLabel.text = userDisplayInput       //display the input numbers
    }
    
    @IBAction func allClearButton(_ sender: roundButton) {      //clear the data stores in var
        numberOutputLabel.text = "0"
        userInput = ""
        userDisplayInput = ""
    }
    
    @IBAction func dotPressedButton(_ sender: roundButton) {    //func to handle when user clicks "."
        userInput += "."                    // append the userInput string with "."
        userDisplayInput += "."
        numberOutputLabel.text = userDisplayInput
    }
    
    @IBAction func equalPressedButton(_ sender: roundButton) {  //func to handle when user clicks "="
        // call the calculate function with the input as userInput string
        // assign output label as the result
        numberOutputLabel.text = String(calculate(input: userInput))
        userInput = ""                          // empty the contents
        userDisplayInput = ""
    }
    
    @IBAction func addPressedButton(_ sender: roundButton) {    //func to handle when user clicks "+"
        userInput += "+"                      // append the userInput string with "+"
        userDisplayInput += "+"
        numberOutputLabel.text = userDisplayInput
    }
    
    @IBAction func subtractPressedButton(_ sender: roundButton) {   //func to handle when user clicks "-"
        userInput += "-"                       // append the userInput string with "-"
        userDisplayInput += "-"
        numberOutputLabel.text = userDisplayInput
    }
    
    @IBAction func multiplyPressedButton(_ sender: roundButton) {   //func to handle when user clicks "×"
        // userDisplayInput will be different to userInput
        // Display "×" but use "*" while calculations
        userInput += "*"                        // append the userInput string with "*"
        userDisplayInput += "×"
        numberOutputLabel.text = userDisplayInput
    }
    
    @IBAction func dividePressedButton(_ sender: roundButton) { //func to handle when user clicks "÷"
        // userDisplayInput will be different to userInput
        // Display "÷" but use "/" while calculations
        userInput += "/"                        // append the userInput string with "/"
        userDisplayInput += "÷"
        numberOutputLabel.text = userDisplayInput
    }
    
    @IBAction func moduloPressedButton(_ sender: roundButton) { //func to handle when user clicks "%"
        userInput += "%"                        // append the userInput string with "%"
        userDisplayInput += "%"
        numberOutputLabel.text = userDisplayInput
    }

    func isStringAnNum(string: String)->Bool{   //Check if an string is a num (int/float/double)
        return Double(string) != nil
    }
    
    // Recursive function to calculate the correct answer. Take input as string returns as double
    func calculate(input: String)->Double{
        
        // Check is the input is a number return with the number else continue the recursion
        if isStringAnNum(string: input){
            return Double(input)!
        }
        
        // operators array with preference to split first. "+" & "-" to be split before "*" & "/"
        let operators = ["+", "-", "*", "/", "%"]
        
        // loop in the order of operators array
        for c in operators {
            // split the input string with operator & maxSplits = 1 so that we only have inputArray of length 2
            let inputArray = input.split(separator: Character(c), maxSplits: 1)
            
            if inputArray.count>1{                  // if the operator exists in the input string, then length = 2
                let left = inputArray[0]            // assign left as first element of inputArray
                let right = inputArray[1]           // assign right as second element of input Array
                let op = c                          // assign op as c i.e the operator
                
                // While spliting give preference to "+" & "-".
                // But calculation should be done for "*" & "/"  before "+" & "-" (If else condition shows that)
                // Return recursive call to the same function with ( left operator right)
                if op == "*"{
                        return (calculate(input: String(left)) * calculate(input: String(right)))
                }

                else if op == "/"{
                        return (calculate(input: String(left)) / calculate(input: String(right)))
                }
                    
                else if op == "%"{
//                      return (calculate(input: String(left)).truncatingRemainder(dividingBy: calculate(input: String(right))))    #if "%" means modulus
                        return ( (calculate(input: String(left))*0.01) * calculate(input: String(right)) )
                }

                else if op == "+"{
                        return (calculate(input: String(left)) + calculate(input: String(right)))
                }

               else if op == "-"{
                        return (calculate(input: String(left)) - calculate(input: String(right)))
                }
            }
                
//          handle if the operator is "%", return (number/100)
//          Check if string contains "%" and the loop variable is also "%"
            else if (inputArray.count == 1) && (input.contains("%")) && (c=="%"){
                let left : Double = Double(inputArray[0])!                  // Only contains 1 element
                return (calculate(input: String(left*0.01)))
            }
            
        }
        // Return 0 for any other cases
        return 0
    }
}
