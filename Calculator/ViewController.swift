//
//  ViewController.swift
//  Calculator
//
//  Created by Ahsen Bahtışen on 3.10.2022.
//

import UIKit

enum Operation:String{
    case Sum = "+"
    case Null = "Null"
}

class ViewController: UIViewController {

    
    @IBOutlet weak var outputLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .Null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
    }

    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8{
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
        }
    }
    
    
    @IBAction func allClear(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .Null
        outputLabel.text = "0"
    }
    
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7{
            runningNumber += "."
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func sumPressed(_ sender: RoundButton) {
        operation(operation: .Sum)
    }
    
    func operation(operation: Operation){
        if currentOperation != .Null{
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber=""
                
                if currentOperation == .Sum{
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation = operation
            
        }else{
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

