//
//  SortingFilterView.swift
//  Econom-Kino
//
//  Created by Slavik on 25.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct SortingFilterView: View {
    @ObservedObject var movieDetailVM = MovieDetailViewModel.shared
    @State var expand: Bool = false
    @State var sorting = "Ціна (дешевші)"
    
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                
                Text("Сортувати:\n\(sorting)")
                    .frame(alignment: .leading)
                    .font(.system(size: 15))
                Spacer()
                Image(systemName: expand ? "chevron.up" : "chevron.down")
            }
            .frame(width: (UIScreen.width - 50) / 2.2, height: 65)
            .onTapGesture {
                withAnimation {
                    self.expand.toggle()
                }
                
            }
            
            if self.expand {
                VStack (alignment: .leading, spacing: 15) {
                    
                    if self.sorting != "Ціна (дешевші)" {
                        Button(action: {
                            withAnimation {
                                self.sorting = "Ціна (дешевші)"
                                self.movieDetailVM.sortSessions(.cheaper)
                            }
                        }) {
                            Text("Ціна (дешевші)")
                        }
                    }
                    
                    if self.sorting != "Ціна (дорожчі)" {
                        Button(action: {
                            withAnimation {
                                self.sorting = "Ціна (дорожчі)"
                                self.movieDetailVM.sortSessions(.expensive)
                            }
                        }) {
                            Text("Ціна (дорожчі)")
                        }
                    }
                    
                    if self.sorting != "Найближчі сеанси" {
                        Button(action: {
                            withAnimation {
                                self.sorting = "Найближчі сеанси"
                                self.movieDetailVM.sortSessions(.time)
                            }
                        }) {
                            Text("Найближчі сеанси")
                        }
                    }
                    
                    if self.sorting != "Рейтинг кінотеатру" {
                        Button(action: {
                            withAnimation {
                                self.sorting = "Рейтинг кінотеатру"
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

struct SortingFilterView_Previews: PreviewProvider {
    static var previews: some View {
        SortingFilterView()
    }
}
