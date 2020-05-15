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
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        ZStack {
            Color.mainGray
            .edgesIgnoringSafeArea(.all)
            
            
            VStack() {
                List(moviesVM.movies) { movie in
                    PosterView(movie: movie).padding(.bottom)
                }
            }
        }.onAppear {
            print("Fetching...")
            self.moviesVM.fetchMovies()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
