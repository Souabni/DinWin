//
//  Couple.swift
//  DinWin
//
//  Created by Dev on 13/11/2017.
//  Copyright © 2017 Dev. All rights reserved.
//

import UIKit

class Couple: NSObject {

    var firstPiece : Piece?
    var secondPiece : Piece?
    
    override init(){
       super.init()
    }
    
    init(random:Bool){
        let colors : [Piece.Color] = [.red,.green,.blue,.yellow]
        let randomIndex  = Int(arc4random_uniform(_:4))
        firstPiece = Piece(color: colors[randomIndex])
    }
    
    func isEmpty()->Bool{
        if firstPiece != nil  {
            return false
        }
      
        return true
    }
    
    func have2Pieces()->Bool{
        if secondPiece != nil  {
            return true
        }
        
        return false
    }
    
    func getTopPiece()->Piece?{
        if secondPiece != nil  {
            return secondPiece
        }else if firstPiece != nil  {
            return firstPiece
        }else{
            return nil
        }
    }
    
    func removeTopPiece(){
        if secondPiece != nil  {
             secondPiece = nil
        }else if firstPiece != nil  {
            firstPiece = nil
        }
    }
    
}
