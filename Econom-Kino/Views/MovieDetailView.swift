//
//  MovieDetailView.swift
//  Econom-Kino
//
//  Created by Slavik on 07.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    @State var show = true
    
    var body: some View {
            ZStack (alignment: .top) {
                Color.mainGray
                    .edgesIgnoringSafeArea(.all)
                    
                VStack () {
                    
                    HeaderMovieDetailView()
                        .padding(.top, -65)
                    
                    ScrollView {
                       MovieDescriptionView()
                    }
                }
            }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
