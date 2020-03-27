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
    
    var body: some View {
        ZStack (alignment: .top) {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.mainGray)
                .frame(width: 179, height: 308.068)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 7, y: 7)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        
            VStack (spacing: 10) {
                WebImage(url: URL(string: posterUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 179)
                    .cornerRadius(25, corners: [.topLeft, .topRight])
                Text(filmName)
                    .font(.system(size: 20))
                    .foregroundColor(Color.mainBlack)
            }
        }.frame(height: 327)
        
    }
}

struct PosterView_Previews: PreviewProvider {
    var testPosterURL = ""
    
    static var previews: some View {
        PosterView(posterUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/fw5qiCNYdCYiPlB2xJvLEnugZNa.jpg", filmName: "Бладшот")
    }
}
