//
//  CalendarView.swift
//  Econom-Kino
//
//  Created by Slavik on 03.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var movieVM: MoviesViewModel

    
    var body: some View {
        ScrollView(.horizontal) {
        HStack (spacing: 15) {
            ForEach(self.movieVM.week, id: \.self) {day in
                
                Button(action: {
                    print("\(day.day).\(day.month): Fetching....")
                    
                    self.movieVM.chosenDate = day.id
                    self.movieVM.fetchMovies(day: self.movieVM.week[self.movieVM.chosenDate].day,
                                             month: self.movieVM.week[self.movieVM.chosenDate].month,
                                             year: self.movieVM.week[self.movieVM.chosenDate].year)
                    self.movieVM.updateChoosenDateStr()
                    
                }){
                    ZStack (alignment: .center) {
                        if self.movieVM.chosenDate == day.id {
                            RoundedRectangle(cornerRadius: 10)
                            .fill(Color.mainGray)
                            .frame(width: 50, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.mainGray, lineWidth: 4)
                                    .shadow(color: Color.mainBlack.opacity(0.2), radius: 3, x: 5, y: 5)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: Color.white, radius: 2, x: -2, y: -2)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            )
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.mainGray)
                                .frame(width: 50, height: 50)
                                .shadow(color: Color.mainBlack.opacity(0.1), radius: 7, x: 5, y: 5)
                                .shadow(color: Color.white.opacity(0.7), radius: 7, x: -5, y: -5)
                        }
                        VStack {
                            Text("\(day.weekDay)")
                                .font(.system(size: 14))
                            Text("\(day.day).\(day.month)")
                                .font(.system(size: 12))
                            
                        }
                         .frame(width: 45, height: 45)
                         .foregroundColor(["Сб", "Нд"].contains(day.weekDay) ? Color.red : Color.mainDarkGray)
                        
                    }
                }
            }
        }
         .padding(.top, 10)
         .padding(.bottom, 15)
        }
    }
}

