//
//  GameHelp.swift
//  TicTacToeGame
//
//  Created by NextAuth on 12/02/2022.
//

import Foundation
import UIKit

class GameHelp {
    // Making Singelton For Game Helper Function
    static let shared = GameHelp()
    
    var firstMove = GameTurns.Cross
    var presentMove = GameTurns.Cross
    
    var ZERO = "O"
    var CROSS = "X"
    
    init() {
        ZERO = "O"
        CROSS = "X"
        firstMove = GameTurns.Cross
        presentMove = GameTurns.Cross
    }
    
    // All Buttons Assigned the Symbol Still not Result
    func gameDraw(Board board: [UIButton]) -> Bool
    {
        for button in board
        {
            if button.title(for: .normal) == nil
            {
                return false
            }
        }
        return true
    }
    
    // Adding Symbol To Board
    func insertSymbols(_ sender: UIButton, closure: @escaping ((String)->Void))
    {
        if(sender.title(for: .normal) == nil)
        {
            if(presentMove == GameTurns.Zero)
            {
                sender.setTitle(ZERO, for: .normal)
                presentMove = GameTurns.Cross
                closure(CROSS)
            }
            else if(presentMove == GameTurns.Cross)
            {
                sender.setTitle(CROSS, for: .normal)
                presentMove = GameTurns.Zero
                closure(ZERO)
            }
            sender.isEnabled = false
        }
    }
    
    // Board Reset
    func resetGame(Board board: [UIButton], closure: @escaping ((String)->Void))
    {
        // Rest Symbols of all the button back to nil
        for button in board
        {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        
        // Swapping of First Move From Cross to Zero and viceversa
        if firstMove == GameTurns.Zero
        {
            firstMove = GameTurns.Cross
            closure(CROSS)
        }
        else if firstMove == GameTurns.Cross
        {
            firstMove = GameTurns.Zero
            closure(ZERO)
        }
        presentMove = firstMove
    }
    
    func compareValues(_ button: UIButton, _ symbol: String) -> Bool
    {
        return button.title(for: .normal) == symbol
    }
    
    func checkWin(_ boardButton :[UIButton],value :String) -> Bool
    {
        // Horizontal
        for i in [0,3,6] {
            if compareValues(boardButton[i], value) && compareValues(boardButton[i+1], value) && compareValues(boardButton[i+2], value)
            {
                return true
            }
        }
        
        // Vertical
        for i in [0,1,2] {
            if compareValues(boardButton[i], value) && compareValues(boardButton[i+3], value) && compareValues(boardButton[i+6], value)
            {
                return true
            }
        }

        // Diagonal
        for i in [0,2] {
            if compareValues(boardButton[i], value) && compareValues(boardButton[i+4], value) && compareValues(boardButton[i+(8-(i*2))], value)
            {
                return true
            }
        }
        
        return false
    }
    
}
