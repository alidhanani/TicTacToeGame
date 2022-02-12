//
//  GameHelp.swift
//  TicTacToeGame
//
//  Created by NextAuth on 12/02/2022.
//

import Foundation

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
    
}
