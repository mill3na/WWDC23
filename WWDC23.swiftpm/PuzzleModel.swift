//
//  PuzzleModel.swift
//  WWDC23
//
//  Created by Milena Maia Araújo on 08/04/23.
//

import Foundation


struct PuzzleModel {
    var puzzles: Array<Puzzle>
    
    init(puzzleInt: Int, incomingString: (Int) -> String) {
        puzzles = Array<Puzzle>()
        for index in 0..<puzzleInt {
            let string = incomingString(index)
            puzzles.append(Puzzle(id: index, strings: string))
        }
        
        puzzles.shuffle()
        
    }
    struct Puzzle: Identifiable {
        let id: Int
        let strings: String
        let boolean: Bool = false
    }
}
