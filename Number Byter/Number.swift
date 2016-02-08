//
//  Number.swift
//  Number Byter
//
//  Created by Krishna Kandula on 2/6/16.
//  Copyright © 2016 Canvas. All rights reserved.
//

import Foundation

//Super class for other number classes
class Number {
    private var hexNum: String
    private var decNum: Int
    private var binNum: String
    private var userInput: String

    init() {
        hexNum = ""
        decNum = 0
        binNum = ""
        userInput = ""
    }
    
    convenience init(userInput: String) {
        self.init()
        self.userInput = userInput.uppercaseString
    }
    
    //Getters and setters

//    func formatUserInput() {
//        userInput = userInput.uppercaseString
//    }
    
    func getUserInput() -> String {
        return userInput
    }
    
    func setUserInput(input: String) {
        self.userInput = input
    }
    
    func getHexNum() -> String {
        return hexNum
    }
    
    func getDecNum() -> Int {
        return decNum
    }
    
    func setHexNum(num: String) {
        hexNum = num
    }
    
    func setDecNum(num: Int) {
        decNum = num
    }
    
    func setBinNum(num: String) {
        self.binNum = num
    }
    
    func getBinNum() -> String {
        return self.binNum
    }

    //checks if string contains anything other than a number
    func checkInput(userInput: String) -> Bool {
        let arr = Array(userInput.characters)
        let numberArr = Array("1234567890".characters)
        if userInput.isEmpty {
            return false
        }
        for character in arr {
            if !numberArr.contains(character) {
                return false
            }
        }
        return true
    }
    
    //converts decimal to hex
    func DecConvertToHex(){
        let num = getDecNum()
        let str = String(num, radix: 16)
        
        setHexNum(str.uppercaseString)
    }
    
    //Converts decimal to binary
    func DecConvertToBin() {
        let num = getDecNum()
        let str = String(num, radix: 2)
        
        setBinNum(str.uppercaseString)
    }
    
}