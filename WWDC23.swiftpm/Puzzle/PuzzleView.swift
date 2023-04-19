//
//  PuuzleView.swift
//  WWDC23
//
//  Created by Milena Maia Araújo on 08/04/23.
//

import SwiftUI

struct PuzzleView: View {
    @ObservedObject var puzzleM = PuzzleViewModel()
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(80)), count: 4)) {
                ForEach(puzzleM.puzzles) { puzzle in
                    CardView(number: puzzle.number, id: puzzle.id)
                        .background(puzzle.rightPosition ? Color.green : Color.gray)
                        .onTapGesture {
                            withAnimation {
                                puzzleM.swapPositions(parametro: puzzle)
                            }
                        }
                }
            }
//            Spacer()
            
            Button{
                withAnimation {
                    puzzleM.newGame()

                }
            } label: {
                Text("Embaralhar")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
        }
    }
    
    struct CardView: View {
        var number: String
        var id: Int
        var body: some View {

                ZStack {
                    if (id != 0) {
                    Rectangle()
                        .stroke()
                        .foregroundColor(Color.white)
                        
                        Image(number)
                            .resizable()
                            .frame(width: 60, height: 60)
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
    }
}

struct PuuzleView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView()
    }
}
