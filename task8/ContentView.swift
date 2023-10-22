//
//  ContentView.swift
//  task8
//
//  Created by Роман on 22/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    var width: CGFloat {
        UIScreen.main.bounds.size.width * 0.25
    }
    
    var height: CGFloat {
        UIScreen.main.bounds.size.height * 0.25
    }
    
    @State private var yOffset: CGFloat = 0.5
//    @State private var xOffset: CGFloat = 1
    
    private var anchor: UnitPoint {
        yOffset > 0.5 ? .bottom : .top
    }
    
    var minusHeight: CGFloat {
        height - 100
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("icon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
                .background(Color.clear)
            Rectangle()
//                .frame(width: width, height: height)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .scaleEffect(x: yOffset >= 1 || yOffset <= 0 ? 0.85 : 1,
                             y: yOffset >= 1 || yOffset <= 0 ? 1.1 : 1,
                             anchor: anchor)
                .animation(.spring(dampingFraction: 0.7), value: yOffset)
            .overlay(alignment: .bottom) {
                let view = Rectangle()
                view
                    .scaleEffect(y: yOffset, anchor: .bottom)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
            }.frame(width: width, height: height)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            yOffset = max(min((1 - value.location.y / height), height), 0)
                        }
                        .onEnded { _ in
                            yOffset = 0.5
                        }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
