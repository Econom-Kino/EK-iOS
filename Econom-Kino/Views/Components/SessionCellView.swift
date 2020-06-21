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
            Text("\(session.start_time[11 ..< 16])")
                .frame(width: (UIScreen.width - 20) * (1.5/10))
            Text("\(session.price ?? 0) грн.")
                .frame(width: (UIScreen.width - 20) * (2/10))
            Text("\(session.technology ?? "-")")
                .frame(width: (UIScreen.width - 20) * (1.5/10))
            Text("\(CinemasViewModel.shared.getCinemaNameByPlaceID(session.cinema ?? ""))")
                .frame(width: (UIScreen.width - 20) * (3/10), alignment: .leading)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal)
        .frame(width: UIScreen.width - 20, height: 40)
        .background(DefaultBackgroundView())
    }
}


struct SessionCellView_Previews: PreviewProvider {
    static var previews: some View {
        SessionCellView(session: Session(id: 1, cinema: "ChIJ4dGDScndOkcRK6iYsuY5rCk", movie: 512, price: 120, start_time: "2020-06-17T17:00:00+03:00", ticket_link: "https://ekinoback.herokuapp.com/", language: "Українська", technology: "3D"))
    }
}
