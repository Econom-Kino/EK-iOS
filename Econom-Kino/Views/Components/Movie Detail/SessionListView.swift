//
//  SessionsView.swift
//  Econom-Kino
//
//  Created by Slavik on 12.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct SessionListView: View {
    @ObservedObject var movieDetailVM = MovieDetailViewModel.shared
    @State var showFilters: Bool = false
    @Binding var showPoster: Bool
    
    
    
    var body: some View {
        VStack () {
            VStack (alignment: .leading, spacing: 0) {
                HStack {
                    Text("Фільтри:")
                        .font(.system(size: 21))
                    Spacer()
                    Image(systemName: self.showFilters ? "chevron.up" : "chevron.down")
                    
                }.foregroundColor(Color.mainDarkGray)
                
                Rectangle()
                    .fill(Color.mainDarkGray)
                    .frame(height: 1)
            }
             .onTapGesture {
                withAnimation {
                    self.showFilters.toggle()
                    
                    if self.showFilters {
                        self.showPoster = false
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            
            if showFilters {
               SessionFiltersView()
            }
            
            
            VStack (alignment: .leading, spacing: 0) {
                Text("Сеанси:")
                    .font(.system(size: 21))
                    .foregroundColor(Color.mainDarkGray)
                Rectangle()
                    .fill(Color.mainDarkGray)
                    .frame(height: 1)
            }.padding(.horizontal)
             .padding(.top)
            
            
            ForEach(movieDetailVM.sessions.filter({
                    movieDetailVM.choosenTechnologies.contains($0.technology ?? "") &&
                    movieDetailVM.chooenCinemas.contains($0.cinema ?? "")
                
            }), id: \.self) { s in
                SessionCellView(session: s).padding(.vertical, 10)
            }
        }
        
    }
}

struct SessionListView_Previews: PreviewProvider {
    static var previews: some View {
        SessionListView(showPoster: .constant(true))
    }
}
