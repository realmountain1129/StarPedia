//
//  MainView.swift
//  SkyWiki
//
//  Created by Jinsan Kim on 2022/05/02.
//

import SwiftUI

struct MainView: View {
    
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    private let minScale = 1.0
    private let maxScale = 5.0
    
    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { state in
                let delta = state / lastScale
                scale *= delta
                lastScale = state
                
            }
            .onEnded { state in
                validateScaleAllowed()
                lastScale = 1.0
                
            }
    }
    
    func getMinimumScaleAllowed() -> CGFloat {
        return max(scale, minScale)
    }
    
    func getMaximumScaleAllowed() -> CGFloat {
        return min(scale, maxScale)
    }
    
    func validateScaleAllowed() {
        scale = getMaximumScaleAllowed()
        scale = getMaximumScaleAllowed()
    }
    
    var body: some View {
        VStack {
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
            
                
                Image("MainBG")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .gesture(magnification)
                    
                
                
                NavigationLink(destination: MoonGridView(), label: {
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .offset(y: -19)
                        .foregroundColor(.clear)
                })
                
                GeometryReader { proxy in
                    NavigationLink(destination: StarGridView(), label: {
                        Rectangle()
                            .frame(width: proxy.size.width, height: proxy.size.height / 2.8)
                            .foregroundColor(.clear)
                    })
                }
                
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
