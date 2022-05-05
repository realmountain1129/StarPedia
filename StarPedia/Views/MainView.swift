//
//  MainView.swift
//  SkyWiki
//
//  Created by Jinsan Kim on 2022/05/02.
//

import SwiftUI

struct MainView: View {
    
    @GestureState var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
            
                Image("MainBG")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .gesture(MagnificationGesture()
                        .updating($scale, body: { (value, scale, trans) in
                            scale = value.magnitude
                        })
                    )
                
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
