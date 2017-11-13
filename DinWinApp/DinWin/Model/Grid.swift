//
//  Grid.swift
//  DinWin
//
//  Created by Dev on 13/11/2017.
//  Copyright © 2017 Dev. All rights reserved.
//

import UIKit

class Grid: NSObject {

    enum Wave:Int{
        case top = 1
        case right
        case bottom
        case left
    }
    
    let nbRows = 5
    let nbColumns = 5
    var couples : [[Couple]] = []
    
    override init() {
        for _ in 0..<nbRows {
            var rowArray :[Couple] = []
            for _ in 0..<nbColumns {
                rowArray.append(Couple())
            }
            couples.append(rowArray)
        }
    }
    
    func applyWaveSens(wave : Wave){
        for row in 0..<nbRows {
           
            for column in 0..<nbColumns {
               applyWaveSens(couplePosition: (x: row, y: column), wave: wave)
            }
           
        }
    }
    
    func applyWaveSens(couplePosition : (x:Int,y:Int), wave : Wave){
        let couple = couples[couplePosition.x][couplePosition.y]
        guard couple.have2Pieces() else{
            return
        }
        
        let (dx,dy) = shiftingXYStep(wave: wave)
        guard  (0..<nbColumns).contains((couplePosition.x+dx)) else {
            return
        }
        
        guard  (0..<nbRows).contains((couplePosition.y+dy)) else {
            return
        }
        
        let nextPosition = (x:couplePosition.x+dx,y:couplePosition.y+dy)
        let coupleToUpdate = couples[nextPosition.x][nextPosition.y]
        coupleToUpdate.firstPiece = couple.secondPiece
        couple.removeTopPiece()
    }
    
    func shiftingXYStep(wave : Wave)->(x:Int,y:Int){
        switch wave {
        case .top:
            return (x:0,y:-1)
        case .right:
            return (x:1,y:0)
        case .bottom:
            return (x:0,y:+1)
        case .left:
            return (x:-1,y:0)
            
        default:
            return (x:0,y:0)
        }
    }
    
}
