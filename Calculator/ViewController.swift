//
//  ViewController.swift
//  Calculator
//
//  Created by Vraj Mehta on 09/04/2020
//

import UIKit

enum Operation: String {
    
    case Add = "+"
    case Substract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var currentOperation: Operation = .NULL
    var userInput: String = ""
    var userDisplayInput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberOutputLabel.text = "0"
    }
    
    @IBAction func numberPressedButton(_ sender: roundButton) {
        userInput += "\(sender.tag)"
        userDisplayInput += "\(sender.tag)"
        numberOutputLabel.text = userDisplayInput
    }
    
    @IBAction func allClearButton(_ sender: roundButton) {
        currentOperation = .NULL
        numberOutputLabel.text = "0"
        userInput = ""
        userDisplayInput = ""
    }
    
    @IBAction func dotPressedButton(_ sender: roundButton) {
        userInput += "."
        userDisplayInput += "."
        numberOutputLabel.text = userDisplayInput
    }
    
    @IBAction func equalPressedButton(_ sender: roundButton) {
        numberOutputLabel.text = String(calculate(input: userInput))
        userInput = ""
        userDisplayInput = ""
    }
    
    @IBAction func addPressedButton(_ sender: roundButton) {
        userInput += "+"
        userDisplayInput += "+"
        numberOutputLabel.text = userDisplayInput
    }
    
    @IBAction func subtractPressedButton(_ sender: roundButton) {
        userInput += "-"
        userDisplayInput += "-"
        numberOutputLabel.text = userDisplayInput
    }
    
    @IBAction func multiplyPressedButton(_ sender: roundButton) {
        userInput += "*"
        userDisplayInput += "×"
        numberOutputLabel.text = userDisplayInput
    }
    
    @IBAction func dividePressedButton(_ sender: roundButton) {
        userInput += "/"
        userDisplayInput += "÷"
        numberOutputLabel.text = userDisplayInput
    }
    
    @IBAction func moduloPressedButton(_ sender: roundButton) {
        userInput += "%"
        userDisplayInput += "%"
        numberOutputLabel.text = userDisplayInput
    }

    func isStringAnNum(string: String)->Bool{
        return Double(string) != nil
    }

    func calculate(input: String)->Double{

        if isStringAnNum(string: input){
            return Double(input)!
        }

        let operators = ["+", "-", "*", "/","%"]

        for c in operators {
            let inputArray = input.split(separator: Character(c), maxSplits: 1)
            
            if inputArray.count>1{
                let left = inputArray[0]
                let right = inputArray[1]
                let op = c

                if op == "*"{
                        return (calculate(input: String(left)) * calculate(input: String(right)))
                }

                else if op == "/"{
                        return (calculate(input: String(left)) / calculate(input: String(right)))
                }
                    
                else if op == "%"{
                        return (calculate(input: String(left)).truncatingRemainder(dividingBy: calculate(input: String(right))))
                }

                else if op == "+"{
                        return (calculate(input: String(left)) + calculate(input: String(right)))
                }

               else if op == "-"{
                        return (calculate(input: String(left)) - calculate(input: String(right)))
                }
            }
        }
        return 0
    }
}
