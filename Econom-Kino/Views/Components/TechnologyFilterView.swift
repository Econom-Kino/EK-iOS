//
//  TechnologyFilterView.swift
//  Econom-Kino
//
//  Created by Slavik on 25.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct TechnologyFilterView: View {
    @State var expand: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Обрати\nтехнології")
                    .font(.system(size: 15))
                Spacer()
                
                Image(systemName: expand ? "chevron.up" : "chevron.down")
                
            }.frame(width: (UIScreen.width - 50) / 2.5, height: 65)
             .onTapGesture {
                withAnimation {
                    self.expand.toggle()
                }
            }
            
            if self.expand  {
               
                VStack {
                    HStack {
                        TechnologyButtonView(technology: "2D")
                        TechnologyButtonView(technology: "3D")
                    }
                    
                    HStack {
                        TechnologyButtonView(technology: "4DX")
                        TechnologyButtonView(technology: "LUX")
                    }
                }.animation(.easeInOut)
            }
             
             
        }.padding(.horizontal, 15)
         .padding(.bottom, self.expand ? 10 : 0)
         .background(DefaultBackgroundView())
        
    }
}


struct TechnologyButtonView: View {
    @ObservedObject var movieDetailVM = MovieDetailViewModel.shared
    let technology: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                
                if self.movieDetailVM.choosenTechnologies.contains(self.technology) {
                    self.movieDetailVM.choosenTechnologies = self.movieDetailVM.choosenTechnologies.filter({
                        $0 != self.technology
                    })
                } else {
                    self.movieDetailVM.choosenTechnologies.append(self.technology)
                }
            }
            
            print("Choosen technologies: \(self.movieDetailVM.choosenTechnologies)")
            
        }) {
            
            ZStack {
                if self.movieDetailVM.choosenTechnologies.contains(technology) {
                    RoundedRectangle(cornerRadius: 10)
                    .fill(Color.mainGray)
                    .frame(width: 60, height: 60)
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
                        .frame(width: 60, height: 60)
                        .shadow(color: Color.mainBlack.opacity(0.1), radius: 7, x: 5, y: 5)
                        .shadow(color: Color.white.opacity(0.7), radius: 7, x: -5, y: -5)
                }
                
                Text("\(technology)")
            }
        }
    }
}




struct TechnologyFilterView_Previews: PreviewProvider {
    static var previews: some View {
        TechnologyFilterView()
    }
}
