//
//  HistoryView.swift
//  WWDC23
//
//  Created by Milena Maia Araújo on 12/04/23.
//

import SwiftUI

struct HistoryView: View {
    var images: [String]
    var body: some View {
            ScrollView {
                VStack {
                    ForEach(images, id: \.self) {image in
                        Image(image)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.50)
                    }
                    Spacer()
                    NavigationLink {
                        PuzzleView()
                    } label: {
                        Text("Puzzle")
                            .foregroundColor(Color.brown)
                            .font(.title3)
                            .padding()
                            .cornerRadius(12)
                            .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.yellow, lineWidth: 2))
                    }
                    
                }
            }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(images: [])
    }
}
