//
//  SessionView.swift
//  Econom-Kino
//
//  Created by Slavik on 15.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct SessionCellView: View {
    var session: Session
    
    
    var body: some View {
        HStack (alignment: .center) {
            Text("16:00")
                .frame(width: (UIScreen.width - 20) * (1.5/10))
            Text("160 грн.")
                .frame(width: (UIScreen.width - 20) * (2/10))
            Text("4Dx")
                .frame(width: (UIScreen.width - 20) * (1.5/10))
            Text("Кінопалац ім. О.Довженка")
                .frame(width: (UIScreen.width - 20) * (3/10))
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal)
        .frame(width: UIScreen.width - 20, height: 40)
        .background(SessionCellBgView())
    }
}

struct SessionCellBgView: View {
    var body: some View {
        ZStack {
            Rectangle()
            .fill(Color.mainGray)
            .cornerRadius(20)
            .shadow(color: Color.mainBlack.opacity(0.2), radius: 5, x: 3, y: 3)
            .shadow(color: Color.white.opacity(0.7), radius: 5, x: -3, y: -3)
            .transition(AnyTransition.opacity.combined(with: .move(edge: .leading)))
        }
    }
}



struct SessionCellView_Previews: PreviewProvider {
    static var previews: some View {
        SessionCellView(session: Session(id: 1, cinema: "Multiplex", movie: 512, price: 123, start_time: "20:30", ticket_link: "https://ekinoback.herokuapp.com/", language: "Українська", technology: "3D"))
    }
}
