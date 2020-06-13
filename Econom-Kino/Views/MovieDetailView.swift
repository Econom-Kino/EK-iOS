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
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
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
                            MovieDescriptionView(movieDetailVM: self.movieDetailVM, movie: self.$movie)
                                .frame(width: g.frame(in : .global).width)
                        }
                        
                        ScrollView {
                            SessionsView().frame(width: g.frame(in : .global).width)
                        }
                        
                        Text(" ").frame(width: g.frame(in : .global).width)
                        
                    }.offset(x: self.offset)
                     .highPriorityGesture(DragGesture()
                         .onEnded({ (value) in
                            
                            withAnimation {
                                if value.translation.width > 50 {
                                    self.index = 1
                                    self.offset = self.width
                                }
                                if -value.translation.width > 50 {
                                    self.show = false
                                    self.index = 2
                                    self.offset = 0
                                }
    
                            }
                        })
                    )
                }
            }
        }
    }
}


struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie())
    }
}
