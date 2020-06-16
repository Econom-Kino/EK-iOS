//
//  MoviesView.swift
//  Econom-Kino
//
//  Created by Slavik on 24.04.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var moviesVM = MovieListViewModel.shared

    init() {
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().tableFooterView = UIView()
    }
    
    
    var body: some View {
        ZStack {
            Color.mainGray.edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .leading) {
                if self.moviesVM.show || self.moviesVM.movies.count == 0 {
                    VStack () {
                        SearchView()
                        CalendarView()
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                } else {
                    Text("\(self.moviesVM.chooseDateStr)")
                        .foregroundColor(Color.mainDarkGray)
                        .padding(.horizontal)
                        .padding(.top, 10)
                        .transition(AnyTransition.opacity.combined(with: .move(edge: .top)))
                }
                
                List(0..<self.moviesVM.movies.count, id: \.self) { i in
                    if i == 0 {
                        ZStack {
                            PosterView(movie: self.moviesVM.movies[i])
                                .padding(.bottom)
                            NavigationLink(destination: MovieDetailView(movie: self.moviesVM.movies[i])) {
                                EmptyView()
                            }
                        }
                        .onAppear {
                            withAnimation {
                                self.moviesVM.show = true
                            }
                        }
                        .onDisappear {
                            withAnimation {
                                self.moviesVM.show = false
                            }
                        }
                        
                    } else {
                        ZStack {
                            PosterView(movie: self.moviesVM.movies[i])
                                .padding(.bottom)
                            NavigationLink(destination: MovieDetailView(movie: self.moviesVM.movies[i])) {
                                EmptyView()
                            }
                        }
                    }
                    
                }
            }
        }
        .navigationBarTitle("Movies")
        .navigationBarHidden(true)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
