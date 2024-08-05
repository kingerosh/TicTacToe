//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ерош Айтжанов on 14.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var game = TicTacToe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        orderLabel.textColor = .blue
        orderLabel.text = "Order of ❎"
    }
    
    
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet var arrayButton: [UIButton]!
    
    @IBAction func restartButton(_ sender: Any) {
        game.restart()
        updateView()
        orderLabel.text = "Order of ❎"
        winLabel.textColor = .green
        winLabel.text = ""
        for i in 0...8 {
            arrayButton[i].isEnabled = true
        }
    }
    var counter = 0
    @IBAction func clickButton(_ sender: UIButton) {
        guard let index = arrayButton.firstIndex(of: sender)
            else {return}
        counter = game.choiceXO(index: index)
        if !game.isGameComputer {
            if counter % 2 != 0 {
                orderLabel.text = "Order of ⭕️"
            } else {
                orderLabel.text = "Order of ❎"
            }
        }
        arrayButton[index].isEnabled = false
        updateView()
        if game.win() == nil {
            if game.isGameComputer {
                let randomIndex = game.computerXO()
                arrayButton[randomIndex].isEnabled = false
                updateView()
            }
        }
    }
    
    
    func updateView() {
        for i in 0...8 {
            let button = arrayButton[i]
            let XO = game.arrayXO[i]
            if XO.isWriteXO {
                button.setTitle(XO.name, for: .normal)
            } else {
                button.setTitle(" ", for: .normal)
            }
        }
        if let win = game.win() {
            orderLabel.text = ""
            if win == "Draw" {
                winLabel.textColor = .blue
                winLabel.text = "\(win)"
            } else {
                if win == "⭕️" {
                    winLabel.textColor = .red
                }
                winLabel.text = "Winner: \(win)"
            }
            for i in 0...8 {
                arrayButton[i].isEnabled = false
            }
        }
    }
    
    
    
}


