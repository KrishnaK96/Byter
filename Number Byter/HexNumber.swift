//
//  HexNumber.swift
//  Number Byter
//
//  Created by Krishna Kandula on 2/6/16.
//  Copyright © 2016 Canvas. All rights reserved.
//

import Foundation

class HexNumber {
    private var hexNum: Int
    private var decNum: Int
    private var userInput: String
    
    //initializers
    init() {
        hexNum = 0x0
        decNum = 0
        userInput = ""
    }
    
    convenience init(userInput: String) {
        self.init()
        self.userInput = userInput
    }
    
    func formatUserInput() {
        userInput = userInput.uppercaseString
    }
    
    //Getters and setters
    func getHexNum() -> Int {
        return hexNum
    }
    
    func getDecNum() -> Int {
        return decNum
    }
    
    func setHexNum(num: Int) {
        hexNum = num
    }
    
    func setDecNum(num: Int) {
        decNum = num
    }
    
    //converts var userInput to decNum (hex to decimal)
    func convertToDec() {
        //THIS WORKS
        setDecNum(Int(strtoul(userInput, nil, 16)))
    }
    
    //converts var userInput to hexNum (decimal to hex)
    //has to return a value because can't convert str to an int
    func convertToHex() -> String {
        
        let num = Int(userInput)
        let str = String(num!, radix: 16)
        
        return str.uppercaseString
    }
}