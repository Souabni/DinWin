//
//  Piece.swift
//  DinWin
//
//  Created by Dev on 13/11/2017.
//  Copyright © 2017 Dev. All rights reserved.
//

import UIKit

class Piece: NSObject {
    
    enum Color: Int {
        case red = 1
        case blue
        case green
        case yellow
    }
    
    let color : Color
    
    
 init(color:Color) {
        self.color = color
    }
}
