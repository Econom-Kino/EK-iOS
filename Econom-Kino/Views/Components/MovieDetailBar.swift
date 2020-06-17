//
//  MovieDetailBar.swift
//  Econom-Kino
//
//  Created by Slavik on 11.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct MovieDetailBar: View {
    @Binding var show: Bool
    @Binding var index: Int
    @Binding var offset : CGFloat
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.mainGray)
                .frame(width: UIScreen.width-20, height: 35)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.mainGray, lineWidth: 4)
                        .shadow(color: Color.mainBlack.opacity(0.2), radius: 3, x: 5, y: 5)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: Color.white, radius: 2, x: -2, y: -2)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
            )
            
            HStack (spacing: 0) {
                Button(action: {
                    withAnimation {
                        self.index = 1
                        self.offset = self.width
                    }
                    
                }) {
                    ZStack {
                        if index == 1 {
                            Rectangle()
                                .fill(Color.mainGray)
                                .frame(width: UIScreen.width/2 - 10, height: 35)
                                .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                                .shadow(color: Color.mainBlack.opacity(0.1), radius: 7, x: 5, y: 5)
                                .shadow(color: Color.white.opacity(0.7), radius: 7, x: -5, y: -5)
                                .transition(AnyTransition.opacity.combined(with: .move(edge: .trailing)))
                        }
                        
                        Text("Опис")
                            .fontWeight(.medium)
                            .foregroundColor(index == 1 ? Color.mainOrange : Color.mainDarkGray)
                        
                    }.frame(width: UIScreen.width/2 - 10)
                }.buttonStyle(PlainButtonStyle())
                
               Button(action: {
                    withAnimation {
                        self.show = false
                        self.index = 2
                        self.offset = 0
                    }
                    
               }) {
                   ZStack {
                       if index == 2 {
                           Rectangle()
                                .fill(Color.mainGray)
                                .frame(width: UIScreen.width/2 - 10, height: 35)
                                .cornerRadius(20, corners: [.topRight, .bottomRight])
                                .shadow(color: Color.mainBlack.opacity(0.2), radius: 5, x: 3, y: 3)
                                .shadow(color: Color.white.opacity(0.7), radius: 5, x: -3, y: -3)
                                .transition(AnyTransition.opacity.combined(with: .move(edge: .leading)))
                       }
                       
                       Text("Сеанси")
                           .fontWeight(.medium)
                           .foregroundColor(index == 2 ? Color.mainOrange : Color.mainDarkGray)
                   }.frame(width: UIScreen.width/2 - 10)
               }.buttonStyle(PlainButtonStyle())
            }
            
        }
    }
}

struct MovieDetailBar_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailBar(show: .constant(true), index: .constant(1), offset: .constant(UIScreen.width))
    }
}
