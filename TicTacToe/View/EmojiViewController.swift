//
//  EmojiViewController.swift
//  TicTacToe
//
//  Created by Ерош Айтжанов on 05.08.2024.
//

import UIKit

class EmojiViewController: UIViewController {
    
    var game = Emoji()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.createGame()

        // Do any additional setup after loading the view.
    }
    @IBOutlet var arrayButtonEmoji: [UIButton]!
    @IBOutlet weak var label: UILabel!
    
    var counter = 0
    var found = 0
    @IBAction func clickButtonEmoji(_ sender: UIButton) {
        guard let index = arrayButtonEmoji.firstIndex(of: sender)
            else {return}
        counter += 1
        if counter <= 2 {
            game.choiceEmoji(index: index)
            arrayButtonEmoji[index].setTitle(game.arrayEmoji[index], for: .normal)
            if counter == 2 {
                if game.checkWin() == "win" {
                    arrayButtonEmoji[game.currentChoices[0]].isEnabled = false
                    arrayButtonEmoji[game.currentChoices[1]].isEnabled = false
                    found += 2
                    counter = 0
                    if found == 4 {
                        label.text = "WIN"
                    }
                }
            }
        } else {
            for i in 0...3{
                arrayButtonEmoji[i].setTitle("", for: .normal)
            }
            game.choiceClear()
            game.choiceEmoji(index: index)
            arrayButtonEmoji[index].setTitle(game.arrayEmoji[index], for: .normal)
            counter = 1
        }
    }
    
    @IBAction func restartButtonEmoji(_ sender: UIButton) {
        game.restart()
        counter = 0
        found = 0
        label.text = ""
        for i in 0...3 {
            arrayButtonEmoji[i].isEnabled = true
            arrayButtonEmoji[i].setTitle("", for: .normal)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
