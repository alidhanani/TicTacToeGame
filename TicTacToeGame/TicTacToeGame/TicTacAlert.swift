//
//  TicTacAlert.swift
//  TicTacToeGame
//
//  Created by Ali Dhanani on 12/02/2022.
//

import Foundation
import UIKit

class TicTacAlert {
    // Making Singelton For Alert
    static let shared = TicTacAlert()
    
    init() {
    }
    
    func finalResultAlert(Title title: String, Cross cross: String, Zero zero: String, CurrentView show: UIViewController ,closure: @escaping (()->Void))
    {
        let message = "\nZeros " + String(zero) + "\n\nCrosses " + String(cross)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            closure()
        }))
        show.present(ac, animated: true)
    }
    
}
