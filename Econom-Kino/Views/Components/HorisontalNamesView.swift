//
//  HorisontalNamesView.swift
//  Econom-Kino
//
//  Created by Slavik on 11.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct HorisontalNamesView: View {
    var name: String
    
    var body: some View {
        Text("\(name)")
        .padding(5)
        .font(.system(size: 14, weight: .light))
            .foregroundColor(.mainBlack)
        .background(BgView())
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

struct HorisontalNamesView_Previews: PreviewProvider {
    static var previews: some View {
        HorisontalNamesView(name: "Test Name")
    }
}
