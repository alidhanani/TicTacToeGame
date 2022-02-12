//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by NextAuth on 12/02/2022.
//

import UIKit

class GameVC: UIViewController {

    // Label With Fix title of Turn
    let lblTurn: UILabel = {
       let lbl = UILabel()
        lbl.text = "Turn"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // Label Changes with the Turn but will start with X
    let lblShow: UILabel = {
       let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // all Button from 1 to 9 on the board
    let boardButton: [UIButton] = {
        var btns: [UIButton] = []
        // creation of 9 buttons that will be set to X and O
        for i in 0..<9 {
            let btn = UIButton(type: .system)
            btn.frame = CGRect(x: 0, y: 0, width: 121, height: 121)
            btn.backgroundColor = .white
            btn.setTitle(nil, for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            // All to be called in the same function
            btn.addTarget(self, action: #selector(boardBtnTapAction), for: .touchUpInside)
            btns.append(btn)
        }
        return btns
    }()
    
    // 3 button per Horizontal Board
    let stackHorizontalBoard: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .black
        stackView.spacing = 3
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // 3 button per Horizontal Board
    let stackHorizontalBoard_1: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .black
        stackView.spacing = 3
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // 3 button per Horizontal Board
    let stackHorizontalBoard_2: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .black
        stackView.spacing = 3
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // Black Frame that has the Line on it
    let stackVerticalBoard: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .black
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var zero = 0 // Number of time Zero won
    var cross = 0 // Number of time Cross won
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        positionDesign() // Desiging the Layout
    }
    
    // Function for desiging the UI by anchors and constraints
    func positionDesign() {
        
        // Adding the Label, buttons, and StackView to the parent view
        for btns in boardButton {
            self.view.addSubview(btns)
        }
        self.view.addSubview(lblTurn)
        self.view.addSubview(lblShow)
        self.view.addSubview(stackHorizontalBoard)
        self.view.addSubview(stackHorizontalBoard_1)
        self.view.addSubview(stackHorizontalBoard_2)
        self.view.addSubview(stackVerticalBoard)
        
        
        // Center
        lblShow.center = self.view.center
        lblTurn.center = self.view.center
        // The main Board for all stackview and buttons
        stackVerticalBoard.center = self.view.center

        // enable auto layout
        for btns in boardButton {
            btns.translatesAutoresizingMaskIntoConstraints = false
        }
        stackHorizontalBoard.translatesAutoresizingMaskIntoConstraints = false
        stackHorizontalBoard_1.translatesAutoresizingMaskIntoConstraints = false
        stackHorizontalBoard_2.translatesAutoresizingMaskIntoConstraints = false
        stackVerticalBoard.translatesAutoresizingMaskIntoConstraints = false
        lblShow.translatesAutoresizingMaskIntoConstraints = false
        lblTurn.translatesAutoresizingMaskIntoConstraints = false
        
        // Add All the Horizontal Board to the Vertical Stack Board
        stackVerticalBoard.addArrangedSubview(stackHorizontalBoard)
        stackVerticalBoard.addArrangedSubview(stackHorizontalBoard_1)
        stackVerticalBoard.addArrangedSubview(stackHorizontalBoard_2)
        
        // Add the 3 button to the first row of the Horizontal Stack View
        stackHorizontalBoard.addArrangedSubview(boardButton[0])
        stackHorizontalBoard.addArrangedSubview(boardButton[1])
        stackHorizontalBoard.addArrangedSubview(boardButton[2])
        
        // Add the 3 button to the second row of the Horizontal Stack View
        stackHorizontalBoard_1.addArrangedSubview(boardButton[3])
        stackHorizontalBoard_1.addArrangedSubview(boardButton[4])
        stackHorizontalBoard_1.addArrangedSubview(boardButton[5])
        
        // Add the 3 button to the third row of the Horizontal Stack View
        stackHorizontalBoard_2.addArrangedSubview(boardButton[6])
        stackHorizontalBoard_2.addArrangedSubview(boardButton[7])
        stackHorizontalBoard_2.addArrangedSubview(boardButton[8])
        
        // Anchors for all
        AnchorForStackView()
        AnchorForTitleLabel()
        AnchorForDescLabel()
        
    }
    
    func AnchorForStackView() {
        // Vertical StackView
        stackVerticalBoard.heightAnchor.constraint(equalToConstant: 400).isActive = true // height 400
        stackVerticalBoard.widthAnchor.constraint(equalToConstant: 300).isActive = true // Width 300
        stackVerticalBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // Screen Center
        stackVerticalBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true // Screen center from y access with 0 meaning moving a little to the top
    }
    
    func  AnchorForTitleLabel() {
        //label title
        lblTurn.heightAnchor.constraint(equalToConstant: 20).isActive = true // height 20
        lblTurn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true // making distance of 5 from the left screen
        lblTurn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true // making distance of 5 from the right screen
        lblTurn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // making it screen center by x axis
        lblTurn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true // having adistance of 100 from the imageView
    }
    
    func AnchorForDescLabel() {
        // label desc for changing X and O
        lblShow.heightAnchor.constraint(equalToConstant: 20).isActive = true // Height to be 20
        lblShow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true // making distance of 5 from the left screen
        lblShow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true // making distance of 5 from the right screen
        lblShow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // making it screen center by x axis
        lblShow.topAnchor.constraint(equalTo: lblTurn.bottomAnchor, constant: 20).isActive = true // having adistance of 20 from the title label
    }
    

    @objc func boardBtnTapAction(_ sender: UIButton)
        {
            // To Do Board Button Action
        }
        

}

