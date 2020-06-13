//
//  HeaderMovieDetailView.swift
//  Econom-Kino
//
//  Created by Slavik on 11.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct HeaderMovieDetailView: View {
    @Binding var movie: Movie
    @Binding var show: Bool

    
    var body: some View {
        VStack () {
            Text("\(movie.name)")
                .font(.system(size: 32))
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .lineLimit(self.show ? 3 : 1)
                .scaleEffect(self.show ? 1 : 0.6)
            
            if self.show {
                ZStack (alignment: .bottom) {
                    WebImage(url: URL(string: "\(movie.poster_link)"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.width / 2.3)
                        .cornerRadius(25)
                        .shadow(color: Color.white.opacity(0.1), radius: 10, x: 2, y: 2)
                    Button(action: {
                        print("Trailer button pressed")
                    }) {
                        ZStack (alignment: .leading) {
                            Rectangle()
                                .fill(Color.mainGray)
                                .opacity(0.75)
                                .frame(width: UIScreen.width / 2.3, height: 45)
                                .cornerRadius(25, corners: [.bottomRight, .bottomLeft])
                            HStack (spacing: 30) {
                                Image(systemName: "play.fill")
                                    .foregroundColor(Color.mainDarkGray)
                                    .font(.system(size: 28))
                                Text("Трейлер")
                                    .foregroundColor(Color.mainDarkGray)
                                    .font(.system(size: 22))
                            }.padding(.leading, 20)
                            
                            
                        }.padding(.top, 10)
                    }.buttonStyle(PlainButtonStyle())
                }
                .transition(AnyTransition.opacity.combined(with: .move(edge: .top)))
                
            }
            
            
            
        }.padding()
        .frame(width: UIScreen.width)
            .background(HeaderBgView(poster_link: movie.poster_link))
    }
}

struct HeaderBgView: View {
    var poster_link: String
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: "\(poster_link)"))
                .resizable()
                .blur(radius: 12)
                .frame(width: UIScreen.width + 50)
                .aspectRatio(contentMode: .fit)
                .clipped()
            Rectangle()
                .fill(Color.mainBlack)
                .opacity(0.3)
        }.edgesIgnoringSafeArea(.top)
        
        
    }
}
