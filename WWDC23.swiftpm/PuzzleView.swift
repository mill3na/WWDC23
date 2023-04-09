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
            LazyVGrid(columns: [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))]) {
                ForEach(puzzleM.puzzles) { puzzle in
                    cardView(number: puzzle.strings, id: puzzle.id)
                    
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
    
    struct cardView: View {
        var number: String
        var id: Int
        var body: some View {

                ZStack {
                    if (id != 0) {
                    Rectangle()
                        .stroke()
                        .foregroundColor(Color.white)
                    Text(number)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                }
            }.background(Color.green)
            
        }
    }
}

struct PuuzleView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView()
    }
}
