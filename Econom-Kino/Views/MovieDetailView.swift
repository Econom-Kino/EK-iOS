//
//  MovieDetailView.swift
//  Econom-Kino
//
//  Created by Slavik on 07.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    @State var show = true
    
    var body: some View {
        GeometryReader { g in
            ZStack (alignment: .top) {
            Color.mainGray
            .edgesIgnoringSafeArea(.all)
                
            VStack () {
                VStack () {
                    Text("Месники: Завершення")
                        .font(.system(size: self.show ? 32 : 21))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .lineLimit(self.show ? 10 : 1)
                        .frame(width: g.size.width-30,alignment: .leading)
                        .padding(.leading, 30)
                    
                    if self.show {
                        WebImage(url: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/w0TeZ0oGijYVubQYAakm7eo41Gn.jpg"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: g.size.width / 2.1)
                            .cornerRadius(25)
                            .shadow(color: Color.white.opacity(0.2), radius: 10, x: 2, y: 2)
                        Button(action: {
                            print("Pressed")
                        }) {
                            ZStack (alignment: .leading) {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.mainGray)
                                    .opacity(0.5)
                                    .frame(width: g.size.width / 2.1, height: 50)
                                HStack (spacing: 30) {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(Color.mainDarkGray)
                                        .font(.system(size: 28))
                                    Text("Трейлер")
                                        .foregroundColor(Color.mainDarkGray)
                                        .font(.system(size: 22))
                                }.padding(.leading, 30)
                                
                                
                            }.padding(.top, 10)

                            
                        }.buttonStyle(PlainButtonStyle())
                    }
                    
                    
                }.padding()
                .frame(width: g.size.width)
            }.background(BackgroundView(g: g))
                .padding(.top, -65)
            }
            
        }
    }
}


struct BackgroundView: View {
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

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
