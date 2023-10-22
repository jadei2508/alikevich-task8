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
    
    @State private var yOffset: CGFloat = 0.2
    @State var soundValue: Double = 0.5
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("icon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(Color.clear)
            let view = Rectangle()
                .frame(width: width, height: height)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
            view.overlay(alignment: .bottom) {
                let view = Rectangle()
                view
                    .scaleEffect(y: yOffset, anchor: .bottom)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                yOffset = max(min((1 - value.location.y / height), height), 0)
                            }
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
