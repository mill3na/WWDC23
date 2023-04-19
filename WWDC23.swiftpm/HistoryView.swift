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
        ZoomableScrollView {
            ScrollView {
                VStack {
                    
                    ForEach(images, id: \.self) {image in
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    Spacer()
                    NavigationLink {
                        PuzzleView()
                    } label: {
                        Label("Puzzle", systemImage: "puzzlepiece.extension.fill")
                            .foregroundColor(Color.white)
                            .font(.title3)
                            .padding()
                            .cornerRadius(12)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }
                    
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


struct ZoomableScrollView<Content: View>: UIViewRepresentable {
    private var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        // set up the UIScrollView
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator  // for viewForZooming(in:)
        scrollView.maximumZoomScale = 20
        scrollView.minimumZoomScale = 1
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bouncesZoom = true
        
        // create a UIHostingController to hold our SwiftUI content
        let hostedView = context.coordinator.hostingController.view!
        hostedView.translatesAutoresizingMaskIntoConstraints = true
        hostedView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostedView.frame = scrollView.bounds
        scrollView.addSubview(hostedView)
        
        return scrollView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(hostingController: UIHostingController(rootView: self.content))
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        // update the hosting controller's SwiftUI content
        context.coordinator.hostingController.rootView = self.content
        assert(context.coordinator.hostingController.view.superview == uiView)
    }
    
    // MARK: - Coordinator
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var hostingController: UIHostingController<Content>
        
        init(hostingController: UIHostingController<Content>) {
            self.hostingController = hostingController
        }
        
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return hostingController.view
        }
    }
}
