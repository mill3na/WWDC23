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
        puzzlefuncao2()
        
    }
    
    mutating func funcao(algo: Puzzle) {
        if let coisa1 = puzzlefuncao1(id: 0) {
            if let coisa2 = puzzlefuncao1(id: algo.id) {
                puzzles.swapAt(coisa1, coisa2)
                puzzlefuncao2()
            }
        }
    }
    
    mutating func puzzlefuncao2() {
        for index in puzzles.indices {
            puzzles[index].boolean = puzzles[index].id == index + 1 ? true : false
        }
    }
    
    func puzzlefuncao1(id: Int) -> Int? {
        for index in puzzles.indices {
            if puzzles[index].id == id {
                return index
            }
        }
        return nil
    }
    struct Puzzle: Identifiable {
        let id: Int
        let strings: String
        var boolean: Bool = false
    }
}
