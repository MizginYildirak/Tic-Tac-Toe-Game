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
        gameIsDraw()
        
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
        let a1Title = a1.title(for: .normal)
        let b1Title = b1.title(for: .normal)
        let c1Title = c1.title(for: .normal)
        let a2Title = a2.title(for: .normal)
        let b2Title = b2.title(for: .normal)
        let c2Title = c2.title(for: .normal)
        let a3Title = a3.title(for: .normal)
        let b3Title = b3.title(for: .normal)
        let c3Title = c3.title(for: .normal)
      
        // Check for horizontal victory
        if (a1Title == currentPlayer && a2Title == currentPlayer && a3Title == currentPlayer) ||
           (b1Title == currentPlayer && b2Title == currentPlayer && b3Title == currentPlayer) ||
           (c1Title == currentPlayer && c2Title == currentPlayer && c3Title == currentPlayer) {
            showAlertMessage()
        }

        // Check for vertical victory
        else if (a1Title == currentPlayer && b1Title == currentPlayer && c1Title == currentPlayer) ||
                (a2Title == currentPlayer && b2Title == currentPlayer && c2Title == currentPlayer) ||
                (a3Title == currentPlayer && b3Title == currentPlayer && c3Title == currentPlayer) {
            showAlertMessage()
        }

        // Check for diagonal victory
        else if (a1Title == currentPlayer && b2Title == currentPlayer && c3Title == currentPlayer) ||
                (a3Title == currentPlayer && b2Title == currentPlayer && c1Title == currentPlayer) {
            showAlertMessage()
        }
    }
    
    func showAlertMessage() {
        let message = "\(currentPlayer) is the winner"
        let dialogMessage = UIAlertController(title: "Attention", message: message, preferredStyle: .actionSheet)
        self.present(dialogMessage, animated: true, completion: nil)
        
        let RESETAction = UIAlertAction(title: "Reset Game", style: .default) { (action:UIAlertAction!) in
       
            self.resetBoard()
        }
        dialogMessage.addAction(RESETAction)
    }
    
    func gameIsDraw() {
            var message = "No winner yet."

        if buttons.allSatisfy({ $0.title(for: .normal) != nil }) {
                message = "Draw!"
            let dialogMessage = UIAlertController(title: "Attention", message: message, preferredStyle: .actionSheet)
            self.present(dialogMessage, animated: true, completion: nil)

            let RESETAction = UIAlertAction(title: "Reset Game", style: .default) { (action:UIAlertAction!) in
                self.resetBoard()
            }
            dialogMessage.addAction(RESETAction)
            }
        }
    
    func resetBoard() {
        for button in self.buttons {
            button.setTitle(nil, for: .normal)
            button.isUserInteractionEnabled = true
            button.setTitleColor(UIColor(red: 1/255, green: 100/255, blue: 100/255, alpha: 1), for: .normal)
        }
    }
}

