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
                
                TechnologyFilterView()
                
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


struct SessionFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        SessionFiltersView()
    }
}
