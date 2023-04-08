//
//  Book.swift
//  WWDC23
//
//  Created by Milena Maia Araújo on 03/04/23.
//

import SwiftUI

struct History: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var choreographer: String
}

var sampHistories: [History] = [
    .init(title: "Don Quixote", imageName: "image1", choreographer: "Petipa"),
    .init(title: "Quebra Nozes", imageName: "image2", choreographer: "Petipa 2"),
    .init(title: "Lago dos Cisnes", imageName: "image3", choreographer: "Petipa 3"),
    .init(title: "Bela adormecida", imageName: "image4", choreographer: "Petipa 4"),
    .init(title: "Laurência ", imageName: "image5", choreographer: "Petipa 5")
]
