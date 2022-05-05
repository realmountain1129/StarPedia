//
//  DetailView.swift
//  SkyWiki
//
//  Created by Jinsan Kim on 2022/05/03.
//

import SwiftUI

struct DetailView: View {
    
    let index: Int
    
    init(index: Int) {
        self.index = index
    }
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                ScrollView{
                    VStack {
                        AsyncImage(url: URL(string: stars[index].URL)) { phase in
                            if let image = phase.image {
                               image
                                .resizable()
                                .scaledToFit()
                            } else if phase.error != nil {
                                Text("No Images")
                                    .frame(alignment: .center)
                            } else {
                                ProgressView()
                            }
                        }
                        .frame(alignment: .topLeading)
                    

                        Text(stars[index].description)
                            .padding(5)
                    }
                }
            }
        }
        .navigationTitle(stars[index].name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(index: 0)
    }
}
