//
//  StarGridView.swift
//  SkyWiki
//
//  Created by Jinsan Kim on 2022/05/02.
//

import SwiftUI

struct StarGridView: View {
    var body: some View {
        
        let columns: [GridItem] = [
            GridItem(.flexible(minimum: 10), spacing: 0),
            GridItem(.flexible(minimum: 10), spacing: 0)
        ]
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(stars, id:\.self) { star in
                        VStack{
                            NavigationLink(destination: DetailView(index: star.id), label: {
                                AsyncImage(url: URL(string: star.URL)) { phase in
                                    if let image = phase.image {
                                       image
                                        .resizable()
                                        .scaledToFit()
                                        .padding(5)
                                    } else if phase.error != nil {
                                        Text("No Image")
                                            .frame(alignment: .center)
                                    } else {
                                        ProgressView()
                                    }
                                }
                                .frame(height: proxy.size.height / 4.5)
                            })
                            Text(star.name)
                        }
                    }
                }
            }
        }
        .navigationTitle("Star")
    }
}

struct StarGridView_Previews: PreviewProvider {
    static var previews: some View {
        StarGridView()
    }
}
