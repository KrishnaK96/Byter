//
//  ViewController.swift
//  Number Byter
//
//  Created by Krishna Kandula on 2/3/16.
//  Copyright © 2016 Canvas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var decButton: Bool = true
    var binButton: Bool = false
    var hexButton: Bool = false
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var resultField: UILabel!
    @IBOutlet var binResultField: UILabel!
    @IBOutlet var hexResultField: UILabel!
    
    @IBOutlet var baseSegmentedControl: UISegmentedControl!
    
    //controls which base to change from and change to
    @IBAction func baseControlChanged(sender: AnyObject) {
        switch baseSegmentedControl.selectedSegmentIndex
        {
            //decimal        
            case 0:
            decButton = true
            binButton = false
            hexButton = false
            
            //binary
        case 1:
            decButton = false
            binButton = true
            hexButton = false
            
            //Hex
        case 2:
            decButton = false
            binButton = false
            hexButton = true
        default:
            break
        }
    }
    
    //calls appropriate conversion method
    @IBAction func convertButton(sender: AnyObject) {
        if decButton {
            convertFromDecimal()
        } else if binButton {
            convertFromBinary()
        } else if hexButton{
            convertFromHex()
            
        }
    }
    
    //runs the appropriate functions to convert a decimal number
    func convertFromDecimal() {
        let newDecNum = Number()
        let checkCharacters = "1234567890"
        if !newDecNum.checkInput(getInput(), checkCharacters: checkCharacters){       //check user input
            newDecNum.setDecNum(0)
        } else {
            newDecNum.setUserInput(getInput())
            newDecNum.setDecNum(Int(newDecNum.getUserInput())!)
        }
        
        resultField.text = "\(newDecNum.getDecNum())"   //display decimal number
        
        newDecNum.DecConvertToBin()
        binResultField.text = "\(newDecNum.getBinNum())"    //convert to binary
        
        newDecNum.DecConvertToHex()
        hexResultField.text = "\(newDecNum.getHexNum())"    //convert to hexadecimal
        
    }
    
    //runs the appropriate functions to convert a binary number
    func convertFromBinary() {
        let newBinNum = BinNum(userInput: getInput())
        newBinNum.binConvertToDec()
        resultField.text = "\(newBinNum.getDecNum())"   //convert binary to decimal
        
        binResultField.text = "\(newBinNum.getUserInput())"  //display binary number
        
        newBinNum.binConvertToHex()
        hexResultField.text = "\(newBinNum.getHexNum())"    //convert binary to hexadecimal
        
    }
    
    //runs the appropriate functions to convert a hex number
    func convertFromHex() {
        //let newHexNum = hexNum(userInput: getInput())
        let newHexNum = hexNum()
        let checkCharacters = "1234567890abcdef"    //characters that the user can input
        if !newHexNum.checkInput(getInput(), checkCharacters: checkCharacters){       //check user input
            newHexNum.setUserInput("0")
        } else {
            newHexNum.setUserInput(getInput())
        }
        newHexNum.hexConvertToDec()
        resultField.text = "\(newHexNum.getDecNum())"   //convert hex to decimal
        
        newHexNum.hexConvertToBin()
        binResultField.text = "\(newHexNum.getBinNum())"    //convert hex to binary
        
        hexResultField.text = "\(newHexNum.getUserInput().uppercaseString)" //display hex number
    }
    
    func getInput() -> String{
        return textField.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //for hiding the keyboard
        self.textField.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
        //close keyboard if user taps outside of keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //close keyboard if user taps "return" key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }


}

