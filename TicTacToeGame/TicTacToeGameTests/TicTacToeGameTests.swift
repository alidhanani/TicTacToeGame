//
//  TicTacToeGameTests.swift
//  TicTacToeGameTests
//
//  Created by Ali Dhanani on 12/02/2022.
//

import XCTest
@testable import TicTacToeGame

class TicTacToeGameTests: XCTestCase {


    func testFirstMove() throws {
        XCTAssertEqual(GameHelp.shared.firstMove, GameTurns.Cross)
        
    }
    
    func testCompareValueX() throws {
        // all Button from 1 to 9 on the board
        let boardButton: UIButton = {
            let btn = UIButton(type: .system)
            btn.frame = CGRect(x: 0, y: 0, width: 121, height: 121)
            btn.backgroundColor = .white
            btn.setTitle("X", for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            return btn
        }()
        XCTAssertEqual(GameHelp.shared.compareValues(boardButton, "X"), true)
        
    }
    
    func testCompareValueO() throws {
        // all Button from 1 to 9 on the board
        let boardButton: UIButton = {
            let btn = UIButton(type: .system)
            btn.frame = CGRect(x: 0, y: 0, width: 121, height: 121)
            btn.backgroundColor = .white
            btn.setTitle("O", for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            return btn
        }()
        XCTAssertEqual(GameHelp.shared.compareValues(boardButton, "O"), true)
        
    }
    
    func testCompareDiffernet() throws {
        // all Button from 1 to 9 on the board
        let boardButton: UIButton = {
            let btn = UIButton(type: .system)
            btn.frame = CGRect(x: 0, y: 0, width: 121, height: 121)
            btn.backgroundColor = .white
            btn.setTitle("X", for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            return btn
        }()
        XCTAssertEqual(GameHelp.shared.compareValues(boardButton, "O"), false)
        
    }
    
    func testGameDraw() throws {
        // all Button from 1 to 9 on the board
        let boardButton: [UIButton] = {
            var btns: [UIButton] = []
            // creation of 9 buttons that will be set to X and O
            for i in 0..<9 {
                let btn = UIButton(type: .system)
                btn.frame = CGRect(x: 0, y: 0, width: 121, height: 121)
                btn.backgroundColor = .white
                btn.setTitle("nil", for: .normal)
                btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
                btns.append(btn)
            }
            return btns
        }()
        boardButton[0].setTitle("X", for: .normal)
        boardButton[1].setTitle("X", for: .normal)
        boardButton[2].setTitle("O", for: .normal)
        boardButton[3].setTitle("O", for: .normal)
        boardButton[4].setTitle("O", for: .normal)
        boardButton[5].setTitle("X", for: .normal)
        boardButton[6].setTitle("X", for: .normal)
        boardButton[7].setTitle("O", for: .normal)
        boardButton[8].setTitle("X", for: .normal)
        XCTAssertEqual(GameHelp.shared.gameDraw(Board: boardButton), true)
        
    }
    
    func testCheckVictoryForX() throws {
        // all Button from 1 to 9 on the board
        let boardButton: [UIButton] = {
            var btns: [UIButton] = []
            // creation of 9 buttons that will be set to X and O
            for i in 0..<9 {
                let btn = UIButton(type: .system)
                btn.frame = CGRect(x: 0, y: 0, width: 121, height: 121)
                btn.backgroundColor = .white
                btn.setTitle("nil", for: .normal)
                btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
                btns.append(btn)
            }
            return btns
        }()
        boardButton[0].setTitle("X", for: .normal)
        boardButton[1].setTitle("X", for: .normal)
        boardButton[2].setTitle("X", for: .normal)
        XCTAssertEqual(GameHelp.shared.checkWin(boardButton, value: "X"), true)
        XCTAssertEqual(GameHelp.shared.checkWin(boardButton, value: "O"), false)
    }


}
