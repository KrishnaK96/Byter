//
//  ViewController.swift
//  Number Byter
//
//  Created by Krishna Kandula on 2/3/16.
//  Copyright © 2016 Canvas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var minusButtonPressed: Bool = false
    var dec2BinButton: Bool = true
    var bin2DecButton: Bool = false
    var dec2HexButton: Bool = false
    var tempString: String = "" //used to store user inputted number before adding a "-""
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var resultField: UILabel!
    @IBOutlet var baseSegmentedControl: UISegmentedControl!
    
    //controls which base to change from and change to
    @IBAction func baseControlChanged(sender: AnyObject) {
        switch baseSegmentedControl.selectedSegmentIndex
        {
            //decimal to binary
        case 0:
            dec2BinButton = true
            bin2DecButton = false
            dec2HexButton = false
            print("Converting decimal to binary")
            
            //binary to decimal
        case 1:
            dec2BinButton = false
            bin2DecButton = true
            dec2HexButton = false
            print("converting binary to decimal")
        case 2:
            dec2BinButton = false
            bin2DecButton = false
            dec2HexButton = true
            print("converting decimal to hex")
        default:
            break
        }
    }
    
    @IBAction func convertButton(sender: AnyObject) {
        if dec2BinButton {
            //if number is a positive decimal
            if minusButtonPressed == false {
                resultField.text = decToBin()
            } else {
                negaDecToBin()
            }
        } else if bin2DecButton {
            resultField.text = String(convertFromBintoDec(getInput()))
        } else if dec2HexButton {
            let newHexNum = HexNumber(userInput: textField.text!)
//            newHexNum.convertToDec()
//            resultField.text = String(newHexNum.getDecNum())
            resultField.text = newHexNum.convertToHex()
        }
    }
    
    //makes the number the user inputted negative
    @IBAction func minusButton(sender: AnyObject) {
        if textField.text != "" {
            if minusButtonPressed == false {
                minusButtonPressed = true
                tempString = textField.text!
                textField.text = "-" + textField.text!
            }
        }
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
    
    //gets the users input and converts it to an integer
    func getInput()-> String {
        if !(textField.text?.isEmpty)!{
            return textField.text!
        } else {
            return ""
        }
    }
    
    //does the math that converts a number from decimal to binary
    func convertFromDecToBin(decimalNum: Int) -> String {
        return String(decimalNum, radix: 2)
    }
    
    //does the math that converts a number from binary to decimal
    func convertFromBintoDec(binNum: String) -> Int {
        let num = strtoul(binNum, nil, 2)
        return Int(num)
    }
    //runs the process of converting from decimal to binary
    func decToBin() -> String {
        let input = Int(getInput())
        var binaryNumber = convertFromDecToBin(input!)
        //print(binaryNumber)
        binaryNumber = formatBinaryNumber(binaryNumber)
        return binaryNumber
    }
    
    //runs the process of converting negative decimal to binary
    func negaDecToBin() -> String {
       twosComplement(decToBin())
        
        return ""
    }
    
    //returns the binary number with a multiple of 4 digits
    func formatBinaryNumber(var binNum: String) ->String {
        while binNum.characters.count % 4 != 0 {
            binNum.insert("0", atIndex: binNum.startIndex)
        }
        if minusButtonPressed == true {
            if binNum.characters.first == "0" {
                var arr = [Character](binNum.characters)
                arr[0] = "1"
                binNum = arr.description
            }
        }
        print("String representation of binary string: " + binNum)
        return binNum
    }
    
    //gets twos complement of a binary number
    func twosComplement(num: String) -> String {
        var arr = [Character](num.characters)
        var str = ""
        arr.removeFirst()
        print(arr)
        for (var x:Int = 0; x < arr.count; x++) {
            if arr[x] == "0" {
                arr[x] = "1"
            } else {
                arr[x] = "0"
            }
            str.append(arr[x])
        }
        print(str)
        //convert back to decimal and add 1
        let num = convertFromBintoDec(str) + 1
        
        //convert back to finished twos complement
        str = convertFromDecToBin(num)
        print(str)
        
        //format the binary string so it looks nicer
        str = formatBinaryNumber(str)
        return ""
    }
    
        //close keyboard if user taps outside of keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //close keyboard if user taps "return" key
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}

