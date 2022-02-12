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
    
}
