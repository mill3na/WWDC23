import SwiftUI

struct ContentView: View {
    var body: some View {
        VideoView(videoId: "https://www.youtube.com/watch?v=9WvQamsXuqI")
            .frame(minWidth: 0, maxHeight: UIScreen.main.bounds.height * 0.3)
            .cornerRadius(12)
            .padding()
    }
}
