//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by Ерош Айтжанов on 14.06.2024.
//

import Foundation

class TicTacToe {
    
    var arrayXO:[XO] = Array(repeating: XO(), count: 9)
    var isGameComputer = false
    var counter = 0
    let winCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var possibleIndecies = [0,1,2,3,4,5,6,7,8]
    
    func choiceXO(index: Int) -> Int {
        if isGameComputer && counter != 0 {
            counter += 2
        } else {
            counter += 1
        }
        possibleIndecies.remove(at: possibleIndecies.firstIndex(of: index)!)
        if counter % 2 == 0 {
            arrayXO[index].name = "⭕️"
        } else {
            arrayXO[index].name = "❎"
        }
        arrayXO[index].isWriteXO = true
        return counter
    }
    
    func computerXO() -> Int {
        let randomIndex = possibleIndecies.randomElement()!
        possibleIndecies.remove(at: possibleIndecies.firstIndex(of: randomIndex)!)
        arrayXO[randomIndex].name = "⭕️"
        arrayXO[randomIndex].isWriteXO = true
        return randomIndex
    }
    
    func win() -> String? {
        for i in winCombination {
            if arrayXO[i[0]].name == arrayXO[i[1]].name &&
                arrayXO[i[1]].name == arrayXO[i[2]].name &&
                arrayXO[i[0]].isWriteXO {
                return arrayXO[i[0]].name
            }
        }
        if counter == 9 {
            return "Draw"
        }
        return nil
    }
    
    func restart() {
        arrayXO = Array(repeating: XO(), count: 9)
        possibleIndecies = [0,1,2,3,4,5,6,7,8]
        counter = 0
    }
    
}
