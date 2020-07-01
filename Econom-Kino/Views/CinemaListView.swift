//
//  CinemaListView.swift
//  Econom-Kino
//
//  Created by Slavik on 30.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct CinemaListView: View {
    @ObservedObject var cinemasVM = CinemasViewModel.shared
    
    var body: some View {
        ZStack {
            Color.mainGray.edgesIgnoringSafeArea(.all)
            
            VStack () {
                VStack (alignment: .leading, spacing: 0) {
                    Text("Кінотеатри:")
                        .font(.system(size: 21))
                        .foregroundColor(Color.mainDarkGray)
                    Rectangle()
                        .fill(Color.mainDarkGray)
                        .frame(height: 1)
                }.padding(.horizontal)
                 .padding(.top)
                
                List(cinemasVM.cinemas, id: \.self) { cinema in
                    ZStack (alignment: .topLeading) {
                        CinemaPosterView(cinema: cinema)
                            .padding(.bottom)
                        NavigationLink(destination: Text("Cinema Detail")) {
                            EmptyView()
                        }
                        
                        VStack (alignment: .leading, spacing: 18) {
                            Text("\(cinema.name!)")
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                            
                            HStack {
                                Image("locationIcon")
                                    .resizable()
                                
                                    .frame(width: 14, height: 20)
                                Text("\(cinema.address!)")
                                    .font(.system(size: 12))
                            }
                            
                        }.padding()
                         .foregroundColor(.white)
                    }
                    
                }
            }
            
        }.navigationBarTitle("Cinemas")
         .navigationBarHidden(true)
    }
}

struct CinemaListView_Previews: PreviewProvider {
    static var previews: some View {
        CinemaListView()
    }
}
