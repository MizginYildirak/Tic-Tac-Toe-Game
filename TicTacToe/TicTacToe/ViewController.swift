//
//  ViewController.swift
//  TicTacToe
//
//  Created by MİZGİN YILDIRAK on 17.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [a1, a2, a3, b1, b2, b3, c1, c2, c3]
        
        for button in buttons {
            button.setTitleColor(UIColor(red: 1/255, green: 100/255, blue: 100/255, alpha: 1), for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 50.0, weight: .heavy)
        }
    }
    
    let firstPlayer = "X"
    let secondPlayer = "O"
    var currentPlayer = "X"
    
    @IBAction func btnTapped(_ sender: UIButton) {
        
        sender.setTitle(currentPlayer, for: .normal)
        sender.isUserInteractionEnabled = false
        checkForWin()
        if (currentPlayer == firstPlayer) {
            currentPlayer = secondPlayer
            turnLabel.text = currentPlayer
        } else {
            currentPlayer = firstPlayer
            turnLabel.text = currentPlayer
            sender.setTitleColor(UIColor(red: 255/255, green: 108/255, blue: 34/255, alpha: 1), for: .normal)
        }
    }
    
    func checkForWin() {
            // Check for horizontal victory
        if a1.title(for: .normal) == currentPlayer && a2.title(for: .normal) == currentPlayer && a3.title(for: .normal) == currentPlayer {
             showAlertMessage()
        }
        
        if b1.title(for: .normal) == currentPlayer && b2.title(for: .normal) == currentPlayer && b3.title(for: .normal) == currentPlayer {
            showAlertMessage()
        }
        
        if c1.title(for: .normal) == currentPlayer && c2.title(for: .normal) == currentPlayer && c3.title(for: .normal) == currentPlayer {
            showAlertMessage()
        }
        
        // Check for vertical victory
        if a1.title(for: .normal) == currentPlayer && b1.title(for: .normal) == currentPlayer && c1.title(for: .normal) == currentPlayer {
            showAlertMessage()
        }  
        
        if a2.title(for: .normal) == currentPlayer && b2.title(for: .normal) == currentPlayer && c2.title(for: .normal) == currentPlayer {
            showAlertMessage()
        }  
        
        if a3.title(for: .normal) == currentPlayer && b3.title(for: .normal) == currentPlayer && c3.title(for: .normal) == currentPlayer {
            showAlertMessage()
        }
        
        // Check for diagonal victory
        if a1.title(for: .normal) == currentPlayer && b2.title(for: .normal) == currentPlayer && c3.title(for: .normal) == currentPlayer {
            showAlertMessage()
        }
        
        if a3.title(for: .normal) == currentPlayer && b2.title(for: .normal) == currentPlayer && c1.title(for: .normal) == currentPlayer {
            showAlertMessage()
        }
        
        func showAlertMessage() {
            let dialogMessage = UIAlertController(title: "Attention", message: "I am an alert message", preferredStyle: .actionSheet)
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
}
