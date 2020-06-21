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
    @State var sortings = ["Ціна (дешевші)", "Ціна (дорожчі)", "Найближчі сеанси", "Рейтинг кінотеатру"]
    
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                
                Text("Сортувати:\n\(sortings[0])")
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
                    Button(action: {
                        let element = self.sortings.remove(at: 1)
                        self.sortings.insert(element, at: 0)

                        withAnimation {
                            self.expand.toggle()
                        }
                        print(self.sortings)
                    }) {
                        Text("\(sortings[1])")
                    }
                    
                    Button(action: {
                        let element = self.sortings.remove(at: 2)
                        self.sortings.insert(element, at: 0)
                        withAnimation {
                            self.expand.toggle()
                        }
                    }) {
                        Text("\(sortings[2])")
                    }
                    
                    Button(action: {
                        let element = self.sortings.remove(at: 3)
                        self.sortings.insert(element, at: 0)
                        withAnimation {
                            self.expand.toggle()
                        }
                    }) {
                        Text("\(sortings[3])")
                    }
                }
            }
            
        }
         .padding(.bottom, expand ? 15 : 0)
         .padding(.horizontal, 15)
         .background(DefaultBackgroundView())
        
        
        
    }
}


struct SessionFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        SessionFiltersView()
    }
}
