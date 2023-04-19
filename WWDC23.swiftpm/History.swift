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
    .init(title: "Don Quixote", imageName: "bg", choreographer: "Marius Petipa e Alexander, 1869", historyImages: ["dq1", "dq2", "dq3"]),
    .init(title: "The creator", imageName: "image1", choreographer: "Milena Maia", historyImages: [])]
