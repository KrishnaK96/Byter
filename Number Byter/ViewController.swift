//
//  ViewController.swift
//  Number Byter
//
//  Created by Krishna Kandula on 2/3/16.
//  Copyright © 2016 Canvas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var minusButtonPressed: Bool = false
    var tempString: String = "" //used to store user inputted number before adding a "-""
    @IBOutlet var textField: UITextField!
    @IBOutlet var resultField: UILabel!
    @IBOutlet var baseSwitch: UISwitch!
    @IBAction func convertButton(sender: AnyObject) {
        //if number is a positive decimal
        if minusButtonPressed == false {
            resultField.text = decToBin()
        } else {
            negaDecToBin()
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //gets the users input and converts it to an integer
    func getInput()-> Int {
        return Int(textField.text!)!
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
        let input = getInput()
        let binaryNumber = convertFromDecToBin(input)
        //print(binaryNumber)
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
        if binNum.characters.first == "0" {
            var arr = [Character](binNum.characters)
            arr[0] = "1"
            binNum = arr.description
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
        var num = convertFromBintoDec(str) + 1
        
        //convert back to finished twos complement
        str = convertFromDecToBin(num)
        print(str)
        
        //format the binary string so it looks nicer
        str = formatBinaryNumber(str)
        return ""
    }
}

