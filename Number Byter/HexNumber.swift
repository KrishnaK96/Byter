//
//  HexNumber.swift
//  Number Byter
//
//  Created by Krishna Kandula on 2/6/16.
//  Copyright © 2016 Canvas. All rights reserved.
//

import Foundation

class HexNumber {
    var num: UInt8
    var test: String
    
    //initialization
    init() {
        num = 0x0000
        test = ""
    }
    
    init(userInput: String) {
        num = 0x0
        test = userInput
    }
    
    func getTest() -> String {
        return test
    }
    
}