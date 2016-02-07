//
//  BinNum.swift
//  Number Byter
//
//  Created by Krishna Kandula on 2/6/16.
//  Copyright © 2016 Canvas. All rights reserved.
//

import Foundation

class BinNum: Number {
    
    func binConvertToDec() {
        setDecNum(Int(strtoul(getUserInput(), nil, 2)))
    }
    
    func binConvertToHex() {
        DecConvertToHex()
    }
}