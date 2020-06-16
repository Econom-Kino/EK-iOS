//
//  SearchView.swift
//  Econom-Kino
//
//  Created by Slavik on 02.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var moviesVM = MovieListViewModel.shared
    
    var body: some View {
        HStack () {
            
            VStack (spacing: 10) {
                TextField("Пошук", text:self.$moviesVM.searchText)
                    .padding()
                    .keyboardType(.default)
            }
            .frame(width: UIScreen.width / 1.3, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.mainGray, lineWidth: 4)
                        .shadow(color: Color.mainBlack.opacity(0.2), radius: 3, x: 5, y: 5)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(color: Color.white, radius: 2, x: -2, y: -2)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                )

            Spacer()
            
            Button(action: {
                print("Search: \(self.moviesVM.searchText)")
                self.moviesVM.searchMoviesByName(search: self.moviesVM.searchText)
            }) {
                ZStack (alignment: .center) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.mainGray)
                        .frame(width: 50, height: 50)
                        .shadow(color: Color.mainBlack.opacity(0.1), radius: 7, x: 5, y: 5)
                        .shadow(color: Color.white.opacity(0.7), radius: 7, x: -5, y: -5)
                    Image("searchIcon")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
            
                
            }
            .buttonStyle(PlainButtonStyle())
            
        }
    }
}
