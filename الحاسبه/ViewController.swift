//
//  ViewController.swift
//  الحاسبه
//
//  Created by abdullah alsayegh on 16/07/2020.
//  Copyright © 2020 abdullah alsayegh. All rights reserved.
//

import UIKit

enum Operation:String {
   case Add = "+"
   case Subscript = "-"
   case Divide = "/"
   case Multiply = "*"
   case NULL = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()

        outputLbl.text = "0"
        
    }
    
    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
           runningNumber += "\(sender.tag)"
           outputLbl.text = runningNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLbl.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
           runningNumber += "."
           outputLbl.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
         operation(operation: currentOperation)
    }
    
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton) {
         operation(operation: .Subscript)
    }
    
    @IBAction func multiplyPressed(_ sender: RoundButton) {
         operation(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: RoundButton) {
         operation(operation: .Divide)
    }
    
    
    func operation(operation: Operation){
        if currentOperation != .NULL{
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                 if currentOperation == .Add {
                         result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Subscript{
                         result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .Multiply{
                         result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide{
                         result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                outputLbl.text = result
            }
            currentOperation = operation
            
        }else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
            
        }
    }
}




