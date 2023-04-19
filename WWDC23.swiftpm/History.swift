//
//  VideoView.swift
//  WWDC23
//
//  Created by Milena Maia Araújo on 12/04/23.
//


import SwiftUI

struct History: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var choreographer: String
    var historyImages: [String]
}

var sampHistories: [History] = [
    .init(title: "Don Quixote", imageName: "image1", choreographer: "Marius Petipa e Alexander, 1869", historyImages: ["dq-dulcineia", "dulcineia", "dq-sp"]),
    .init(title: "Quebra Nozes", imageName: "image2", choreographer: "Petipa 2", historyImages: ["dq-dulcineia", "dq-sp"]),
    .init(title: "Lago dos Cisnes", imageName: "image3", choreographer: "Petipa 3", historyImages: ["dq-dulcineia", "dq-sp"]),
    .init(title: "Bela adormecida", imageName: "image4", choreographer: "Petipa 4", historyImages: ["dq-dulcineia", "dq-sp"]),
    .init(title: "Laurência ", imageName: "image5", choreographer: "Petipa 5", historyImages: ["dq-dulcineia", "dq-sp"])
]
