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
    @State var show = true
    var geometry: GeometryProxy
    
    var body: some View {
        VStack () {
            Text("Месники: Завершення")
                .font(.system(size: self.show ? 32 : 21))
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .lineLimit(self.show ? 10 : 1)
                .frame(width: geometry.size.width-30,alignment: .leading)
                .padding(.leading, 30)
            
            if self.show {
                ZStack (alignment: .bottom) {
                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/w0TeZ0oGijYVubQYAakm7eo41Gn.jpg"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width / 2.3)
                        .cornerRadius(25)
                        .shadow(color: Color.white.opacity(0.2), radius: 10, x: 2, y: 2)
                    Button(action: {
                        print("Trailer button pressed")
                    }) {
                        ZStack (alignment: .leading) {
                            Rectangle()
                                .fill(Color.mainGray)
                                .opacity(0.65)
                                .frame(width: geometry.size.width / 2.3, height: 45)
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
                
            }
            
            
            
        }.padding()
        .frame(width: geometry.size.width)
        .background(HeaderBgView(g: geometry))
    }
}

struct HeaderBgView: View {
    var g: GeometryProxy
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string:      "https://image.tmdb.org/t/p/w600_and_h900_bestv2/w0TeZ0oGijYVubQYAakm7eo41Gn.jpg"))
                .resizable()
                .blur(radius: 12)
                .frame(width: g.size.width+50)
                .aspectRatio(contentMode: .fit)
                .clipped()
            Rectangle()
                .fill(Color.mainBlack)
                .opacity(0.3)
        }.edgesIgnoringSafeArea(.top)
        
        
    }
}
