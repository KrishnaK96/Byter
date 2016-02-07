//
//  HexNum.swift
//  Number Byter
//
//  Created by Krishna Kandula on 2/6/16.
//  Copyright © 2016 Canvas. All rights reserved.
//

import Foundation

class hexNum: Number {
    

    //converts var userInput to decNum (hex to decimal)
    func hexConvertToDec() {
        //THIS WORKS
        setDecNum(Int(strtoul(getUserInput(), nil, 16)))
        
    }
    
    func hexConvertToBin() {
        let num = getDecNum()
        let str = String(num, radix: 2)
        setBinNum(str)
    }
    
}