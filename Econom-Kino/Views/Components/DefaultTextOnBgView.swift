//
//  HorisontalNamesView.swift
//  Econom-Kino
//
//  Created by Slavik on 11.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct DefaultTextOnBgView: View {
    var text: String
    var fontSize: CGFloat = 14
    
    var body: some View {
        Text("\(text)")
            .padding(7)
            .font(.system(size: fontSize, weight: .light))
            .foregroundColor(.mainBlack)
            .background(DefaultBackgroundView())
    }
}

struct BgView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.mainGray)
            .shadow(color: Color.mainBlack.opacity(0.1), radius: 7, x: 5, y: 5)
            .shadow(color: Color.white.opacity(0.7), radius: 7, x: -5, y: -5)
    }
}

struct DefaultTextOnBgView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultTextOnBgView(text: "Test Name")
    }
}
