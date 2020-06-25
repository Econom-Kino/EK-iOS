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
    @ObservedObject var movieDetailVM = MovieDetailViewModel.shared
    var moviesVM = MovieListViewModel.shared
    
    @State var movie: Movie
    
    @State var show: Bool = true
    @State var index: Int = 1
    @State var offset : CGFloat = UIScreen.main.bounds.width
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack (alignment: .top) {
            Color.mainGray
            .edgesIgnoringSafeArea(.all)

                    
            VStack () {
                HeaderMovieDetailView(movie: $movie, show: $show)
                    .padding(.top, -65)
                    .highPriorityGesture(DragGesture()
                        .onChanged { value in
                            withAnimation {
                                if value.translation.height > 0 {
                                    self.show = true
                                }
                                if -value.translation.height > 50 {
                                    self.show = false
                                }
                            }
                        }
                    )
                
                MovieDetailBar(show: $show, index: $index, offset: $offset)
                    
                
                GeometryReader{ g in
                    HStack {
                        ScrollView {
                            MovieDescriptionView(movie: self.$movie)
                                .frame(width: g.frame(in : .global).width)
                        }
                        
                        ScrollView {
                            SessionListView(showPoster: self.$show)
                                .frame(width: g.frame(in : .global).width)
                        }
                        
                        Text(" ").frame(width: g.frame(in : .global).width)
                        
                    }.offset(x: self.offset)
                     .highPriorityGesture(DragGesture()
                         .onEnded({ (value) in
                            
                            withAnimation {
                                if value.translation.width > 50 {
                                    self.index = 1
                                    self.offset = self.width
                                    self.show = true
                                }
                                if -value.translation.width > 50 {
                                    self.index = 2
                                    self.offset = 0
                                }
    
                            }
                        })
                    )
                }
            }
        }.onAppear {
                print("Fetching movie sessions...")
                self.movieDetailVM.fetchSessions(day: self.moviesVM.week[self.moviesVM.chosenDate].day,
                                                 month: self.moviesVM.week[self.moviesVM.chosenDate].month,
                                                 year: self.moviesVM.week[self.moviesVM.chosenDate].year,
                                                 movie: self.movie.id)
                
        }
    }
}


struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie())
    }
}
