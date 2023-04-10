//
//  VideoView.swift
//  WWDC23
//
//  Created by Milena Maia Araújo on 09/04/23.
//

import WebKit
import SwiftUI


struct VideoView: UIViewRepresentable {
    
    
    let videoId: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiview: WKWebView, context: Context) {
        guard let videoURL = URL(string: videoId) else {return}
        uiview.scrollView.isScrollEnabled = false
        uiview.load(URLRequest(url: videoURL))
    }
}
