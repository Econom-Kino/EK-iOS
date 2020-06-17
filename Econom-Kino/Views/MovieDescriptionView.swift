//
//  MovieDescriptionView.swift
//  Econom-Kino
//
//  Created by Slavik on 11.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct MovieDescriptionView: View {
    @Binding var movie: Movie

    
    var body: some View {
        VStack (alignment: .leading, spacing: 8) {
            HStack (alignment: .top) {
                Text("Вік:").font(.system(size: 18, weight: .medium))
                Text("\(movie.age ?? false ? "18+" : "0+")").font(.system(size: 18))
            }
            HStack (alignment: .top) {
                Text("Режисер:").font(.system(size: 18, weight: .medium))
                Text("\(movie.director ?? "")").font(.system(size: 18))
            }
            HStack (alignment: .top) {
                Text("Imdb:").font(.system(size: 18, weight: .medium))
                Text("\(String(format: "%.1f", movie.rating ?? 0.0)) ").font(.system(size: 18))
            }
            HStack (alignment: .top) {
                Text("Жанр:")
                    .font(.system(size: 18, weight: .medium))
                Text("\(movieGenresToString(genres: movie.genre_names ?? []))")
                    .font(.system(size: 18))
            }
            HStack (alignment: .top) {
                Text("Тривалість:").font(.system(size: 18, weight: .medium))
                Text("\(movie.duration ?? 0) хв.").font(.system(size: 18))
            }
            HStack (alignment: .top) {
                Text("Виробництво:").font(.system(size: 18, weight: .medium))
                Text("\(movie.country_production ?? "")").font(.system(size: 18))
            }
            HStack (alignment: .top) {
                Text("Премє'ра:").font(.system(size: 18, weight: .medium))
                Text("\(movie.release_date ?? "")").font(.system(size: 18))
            }

           
            VStack {
                VStack (alignment: .leading, spacing: -5) {
                    Text("Студія:").font(.system(size: 18, weight: .medium))
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(movie.studio_names ?? [], id: \.self) {studio in
                                HorisontalNamesView(name: studio.name)
                            }
                        }.padding(.vertical, 12)
                    }
                } // Studios
                VStack (alignment: .leading, spacing: -5) {
                    Text("У головних ролях:").font(.system(size: 18, weight: .medium))
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(movie.actors_names ?? [], id: \.self) {actor in
                                HorisontalNamesView(name: actor.name)
                            }
                        }.padding(.vertical, 12)
                    }
                } // Main roles
            }
            
            Text("Опис: ").font(.system(size: 18, weight: .medium))
            Text("\(movie.description ?? "")")
            
        }.padding()
         .foregroundColor(Color.mainBlack)
    }
}

struct MovieDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDescriptionView(movie: .constant(Movie()))
    }
}
