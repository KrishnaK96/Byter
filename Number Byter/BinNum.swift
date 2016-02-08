//
//  BinNum.swift
//  Number Byter
//
//  Created by Krishna Kandula on 2/6/16.
//  Copyright © 2016 Canvas. All rights reserved.
//

import Foundation

class BinNum: Number {
    
    //checks to see if user input contains any wrong characters
    override func getUserInput() -> String {
        let checkInput = Array(super.getUserInput().characters) //creates an array of all the characters
        for character in checkInput {                           //loops through array
            if character != "0" && character != "1" {           //if character isn't a 1 or a 0, sets user input to 0
                super.setUserInput("0")
                break
            }
        }
        if super.getUserInput().isEmpty{                        //if userinput is empty then sets user input to 0
            super.setUserInput("0")
        }
        return super.getUserInput()
    }
    
    func binConvertToDec() {
        setDecNum(Int(strtoul(getUserInput(), nil, 2)))
    }
    
    func binConvertToHex() {
        DecConvertToHex()
    }
}