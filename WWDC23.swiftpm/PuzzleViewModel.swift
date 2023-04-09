//
//  PuzzleViewModel.swift
//  WWDC23
//
//  Created by Milena Maia Araújo on 08/04/23.
//

import Foundation

class PuzzleViewModel: ObservableObject {
    static var numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    @Published var puzzleModel: PuzzleModel
    
    
    init() {
        self.puzzleModel = PuzzleViewModel.puzzleSomething()
    }

    static func puzzleSomething() -> PuzzleModel {
        return PuzzleModel(puzzleInt: 13) { puzzleIndex in
            PuzzleViewModel.numbers[puzzleIndex]
        }
    }
    
    func newGame() {
        puzzleModel = PuzzleViewModel.puzzleSomething()
    }
    
    func funcao(parametro: PuzzleModel.Puzzle) {
        puzzleModel.funcao(algo: parametro)
    }
    
    var puzzles: Array<PuzzleModel.Puzzle> {
        puzzleModel.puzzles
    }
 
}
