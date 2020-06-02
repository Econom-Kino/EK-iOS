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
        GeometryReader { geometry in
        ZStack {
            Color.mainGray
            .edgesIgnoringSafeArea(.all)
            
            VStack () {
                SearchView(moviesVM: self.moviesVM, geometry: geometry)
                
                List(self.moviesVM.movies) { movie in
                    ZStack {
                        PosterView(movie: movie)
                            .padding(.bottom)
                        NavigationLink(destination: Text("Movie Details")) {
                            EmptyView()
                        }
                    }
                }
            }
        }
        .onAppear {
            print("Fetching...")
            self.moviesVM.fetchMovies()
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
