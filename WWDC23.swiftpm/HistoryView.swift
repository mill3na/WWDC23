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
            }
            .padding()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(images: [])
    }
}
