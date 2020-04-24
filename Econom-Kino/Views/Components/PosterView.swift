//
//  PosterView.swift
//  Econom-Kino
//
//  Created by Slavik on 20.03.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct PosterView: View {
    let posterUrl: String
    let filmName: String
    let filmAge = "13+"
    let filmGenres = "Бойовик, Драма"
    let filmDuration = 115
    let filmRating = 8.1
    let filmLanguage = "English"
    
    var body: some View {
        ZStack (alignment: .leading) {
            // Backgroun Image
            WebImage(url: URL(string: posterUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 220.0, alignment: .center)
                .clipped()
                .cornerRadius(25)
                .shadow(color: Color.mainBlack.opacity(0.2), radius: 10, x: 5, y: 5)
            
            // Blur background image
            BlurView(.dark)
                .frame(height: 220.0)
                .cornerRadius(25)
            
        
            HStack (alignment: .top, spacing: 5) {
                // Movie poster
                WebImage(url: URL(string: posterUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 220)
                    .cornerRadius(25, corners: [.topLeft, .bottomLeft])
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 7, y: 7)
                
                // Movie Info
                VStack (alignment: .leading, spacing: 15) {
                   Text(filmName)
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                    
                    Text("Вік: \(filmAge)\n" +
                         "Жанр: \(filmGenres)\n" +
                         "Imdb: \(filmRating)\n" +
                         "Тривалість: \(filmDuration)\n" +
                         "Мова: \(filmLanguage)")
                        .font(.body)
                        .foregroundColor(Color.white)
                }.padding(10)
                Spacer()
            }
        }
        
    }
}

struct PosterView_Previews: PreviewProvider {
    var testPosterURL = ""
    
    static var previews: some View {
        PosterView(posterUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/fw5qiCNYdCYiPlB2xJvLEnugZNa.jpg", filmName: "Месники: Завершення")
    }
}
