//
//  MoviesView.swift
//  Econom-Kino
//
//  Created by Slavik on 24.04.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    var testPoster = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/2WtmGXoskpqN41yrJ9QNA3eucSp.jpg"
    var testMovieName = "Movie: name"
    
    var body: some View {
        ZStack {
            Color.mainGray
            .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack (spacing: 20) {
                    PosterView(posterUrl: testPoster, filmName: testMovieName)
                    PosterView(posterUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/uUAD59mJPtbqRZa3eFRPsqFdYhM.jpg", filmName: testMovieName)
                    PosterView(posterUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/kKecS2oYAwCsaygKZh9NPCiceJG.jpg", filmName: testMovieName)
                    PosterView(posterUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/J4SD9XDUnCmxBDHh2kSvXcXNtW.jpg", filmName: testMovieName)
                }.padding()
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
