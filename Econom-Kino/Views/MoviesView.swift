//
//  MoviesView.swift
//  Econom-Kino
//
//  Created by Slavik on 24.04.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject private var moviesVM = MoviesViewModel()

    init() {
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().tableFooterView = UIView()
    }
    
    
    var body: some View {
        GeometryReader { g in
        ZStack {
            Color.mainGray
            .edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .leading) {
                if self.moviesVM.show || self.moviesVM.movies.count == 0 {
                    VStack () {
                        SearchView(moviesVM: self.moviesVM, geometry: g)
                        CalendarView(movieVM: self.moviesVM)
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
                            NavigationLink(destination: Text("Movie Details")) {
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
                            NavigationLink(destination: Text("Movie Details")) {
                                EmptyView()
                            }
                        }
                    }
                    
                }
            }
        }
        .onAppear {
            print("Generating calendar..")
            self.moviesVM.makeCalendar()
            self.moviesVM.updateChoosenDateStr()
            
            print("Init Fetching...")
            self.moviesVM.fetchMovies(day: self.moviesVM.week[self.moviesVM.chosenDate].day,
                                      month: self.moviesVM.week[self.moviesVM.chosenDate].month,
                                      year: self.moviesVM.week[self.moviesVM.chosenDate].year)
        }
        .navigationBarTitle("Movies")
        .navigationBarHidden(true)
    }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
