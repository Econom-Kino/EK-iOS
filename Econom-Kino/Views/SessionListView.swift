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
    
    
    
    var body: some View {
        VStack (alignment: .leading) {
            
            VStack (alignment: .leading, spacing: 0) {
                Text("Сеанси:")
                    .font(.system(size: 21))
                    .foregroundColor(Color.mainDarkGray)
                Rectangle()
                    .fill(Color.mainDarkGray)
                    .frame(height: 1)
            }.padding(.horizontal)
             .padding(.top)
            
            
            ForEach(movieDetailVM.sessions, id: \.self) { s in
                SessionCellView(session: s).padding(.vertical, 10)
            }
        }
        
    }
}

struct SessionListView_Previews: PreviewProvider {
    static var previews: some View {
        SessionListView( )
    }
}
