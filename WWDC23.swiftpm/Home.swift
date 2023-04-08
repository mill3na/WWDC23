//
//  Home.swift
//  WWDC23
//
//  Created by Milena Maia Araújo on 03/04/23.
//

import SwiftUI

struct Home: View {
    // MARK: -- animation proprieties
    @State var currentHistory: History = sampHistories.first!
    
    var body: some View {
        VStack {
            headerView()
            
            historySlider()
            
            // MARK: -- view's details
            historyDetailView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    @ViewBuilder
    func historyDetailView() -> some View {
        VStack {
            GeometryReader {
                let size = $0.size
                // MARK:  delayed slider effect
                HStack(spacing: 0) {
                    ForEach(sampHistories) { history in
                        let index = indexOf(history: history)
                        let currentIndex = indexOf(history: currentHistory)
                        
                        VStack (alignment: .leading, spacing: 18) {
                            Text(history.title)
                                .font(.largeTitle)
                                .foregroundColor(.black.opacity(0.7))
                            
                            // MARK: Sliding to the Current Index Position with Delay Based on Index
                                .offset(x: CGFloat (currentIndex) * -(size.width + 30))
                                . opacity (currentIndex == index ? 1: 0)
                                .animation (.interactiveSpring (response: 0.6, dampingFraction: 0.7, blendDuration:
                                0.7).delay (currentIndex < index ? 0.1 : 0), value:
                                currentIndex == index)
                            Text("By \(history.choreographer)")
                                .font(.callout)
                                .foregroundColor(.black.opacity(0.7))
                                .offset(x: CGFloat (currentIndex) * -(size.width + 30))
                                . opacity (currentIndex == index ? 1: 0)
                                .animation (.interactiveSpring (response: 0.6, dampingFraction: 0.7, blendDuration:
                                0.7).delay (currentIndex < index ? 0.1 : 0), value: currentIndex == index)
                            
                        }
                        .frame(width: size.width + 30, alignment: .leading)
                    }
                }
                

            }
            .frame(height: 100)
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
            
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(.gray.opacity(0.4))
                

                GeometryReader {
                    let size = $0.size
                    // MARK: -- update progress bar
                    Capsule()
                        .fill(Color.blue)
                        .frame(width: CGFloat(indexOf(history: currentHistory)) / CGFloat(sampHistories.count - 1) * size.width)
                        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.75, blendDuration: 0.75), value: currentHistory)
                }
            }
            .frame(height: 4)
            .padding(.top, 10)
            .padding([.horizontal, .bottom], 15)
        }
    }
    
    // MARK: -- index
    func indexOf(history: History) -> Int {
        if let index = sampHistories.firstIndex(of: history) {
            return index
        }
        return 0
    }
    
    // MARK: -- book slider
    @ViewBuilder
    func historySlider() -> some View {
        TabView(selection: $currentHistory) {
            ForEach(sampHistories) { history in
                historyView(history: history)
                    .tag(history)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background {
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.6)
        }

    }
    
    @ViewBuilder
    func historyView(history: History) -> some View {
        GeometryReader {
            let size = $0.size
            
            ZStack {
                
                Image(history.imageName)
                    .resizable()
                    .frame(width: size.width / 1.2, height: size.height / 1.5)
                    .aspectRatio(contentMode: .fill)
//                    .clipped()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(.horizontal, 50)
    }
    
    // MARK: -- header view
    @ViewBuilder
    func headerView() -> some View {
        HStack (spacing: 15) {
            Text("Repertory Histories")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black.opacity(0.7))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                
            } label: {
                Image(systemName: "books.vertical")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            
            Button {
                
            } label: {
                Image(systemName: "book.closed")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
        }
        .padding(15)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
