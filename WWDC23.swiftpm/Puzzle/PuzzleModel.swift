//
//  PuzzleModel.swift
//  WWDC23
//
//  Created by Milena Maia Araújo on 08/04/23.
//

import Foundation


struct PuzzleModel {
    var puzzles: [Puzzle]
    
    init(puzzleInt: Int, incomingString: (Int) -> String) {
        puzzles = Array<Puzzle>()
        for index in 0..<puzzleInt {
            let string = incomingString(index)
            puzzles.append(Puzzle(id: index, number: string))
        }
        
        puzzles.shuffle()
        checkPosition()
        
    }
    
    mutating func swapPositions(puzzle: Puzzle) {
        if let coisa1 = checkIndexPosition(id: 0) {
            if let coisa2 = checkIndexPosition(id: puzzle.id) {
                puzzles.swapAt(coisa1, coisa2)
                checkPosition()
            }
        }
    }
    
    mutating func checkPosition() {
        for index in puzzles.indices {
            puzzles[index].rightPosition = puzzles[index].id == index + 1 ? true : false
        }
    }
    
    func checkIndexPosition(id: Int) -> Int? {
        for index in puzzles.indices {
            if puzzles[index].id == id {
                return index
            }
        }
        return nil
    }
    struct Puzzle: Identifiable {
        let id: Int
        let number: String
        var rightPosition: Bool = false
    }
}
