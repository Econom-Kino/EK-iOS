//
//  SesionFiltersView.swift
//  Econom-Kino
//
//  Created by Slavik on 19.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct SessionFiltersView: View {
    @ObservedObject var movieDetailVM = MovieDetailViewModel.shared
    
    
    var body: some View {
        VStack (spacing: 15) {
            HStack (alignment: .top) {
                SortingFilterView()
                
                Spacer()
                
                HStack {
                    Text("Сортувати по даті")
                        .frame(width: (UIScreen.width - 50) / 3)
                        .font(.system(size: 16))
                    Spacer()
                    Image(systemName: "arrowtriangle.right.fill")
                }
                 .padding(.horizontal, 15)
                .frame(width: (UIScreen.width - 50) / 2, height: 65)
                 .background(DefaultBackgroundView())
            }
            HStack {
                HStack {
                    Text("Обрати\nкінотеатри")
                        .font(.system(size: 18))
                    Spacer()
                    Image(systemName: "arrowtriangle.right.fill")
                }
                .padding(.horizontal, 15)
                .frame(width: (UIScreen.width - 50) * 0.82, height: 65)
                .background(DefaultBackgroundView())
                
                Spacer()
                Button(action: {
                    self.movieDetailVM.sessions.remove(at: 1)
                }) {
                    ZStack {
                        Image("dustBinIcon")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                    .frame(width: 65, height: 65)
                    .background(DefaultBackgroundView())
                }
                
                    
            }
            
        }
        .padding()
        .foregroundColor(Color.mainDarkGray)
    }
}


struct SortingFilterView: View {
    @ObservedObject var movieDetailVM = MovieDetailViewModel.shared
    @State var expand: Bool = false
    @State var sorting = "Ціна (дешевші)"
    
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                
                Text("Сортувати:\n\(sorting)")
                    .frame(alignment: .leading)
                    .font(.system(size: 16))
                Spacer()
                Image(systemName: expand ? "chevron.up" : "chevron.down")
            }
             .frame(width: (UIScreen.width - 50) / 2, height: 65)
            .onTapGesture {
                withAnimation {
                    self.expand.toggle()
                }
                
            }
            
            if self.expand {
                VStack (alignment: .leading, spacing: 15) {
                    
                    if self.sorting != "Ціна (дешевші)" {
                        Button(action: {
                            self.sorting = "Ціна (дешевші)"
                            withAnimation {
                                self.movieDetailVM.sortSessions(.cheaper)
                            }
                            print(self.sorting)
                        }) {
                            Text("Ціна (дешевші)")
                        }
                    }
                    
                    if self.sorting != "Ціна (дорожчі)" {
                        Button(action: {
                            self.sorting = "Ціна (дорожчі)"
                            withAnimation {
                                self.movieDetailVM.sortSessions(.expensive)
                            }
                        }) {
                            Text("Ціна (дорожчі)")
                        }
                    }
                    
                    if self.sorting != "Найближчі сеанси" {
                        Button(action: {
                            self.sorting = "Найближчі сеанси"
                            withAnimation {
                                self.movieDetailVM.sortSessions(.time)
                            }
                        }) {
                            Text("Найближчі сеанси")
                        }
                    }
                    
                    if self.sorting != "Рейтинг кінотеатру" {
                        Button(action: {
                            self.sorting = "Рейтинг кінотеатру"
                            withAnimation {
                                self.movieDetailVM.sortSessions(.cinemaRating)
                            }
                        }) {
                            Text("Рейтинг кінотеатру")
                        }
                    }
                }
            }
        }.padding(.horizontal, 15)
         .padding(.bottom, self.expand ? 10 : 0)
         .background(DefaultBackgroundView())
    }
}


struct SessionFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        SessionFiltersView()
    }
}
