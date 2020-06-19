//
//  DefaultBackgroundView.swift
//  Econom-Kino
//
//  Created by Slavik on 19.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct DefaultBackgroundView: View {
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

struct DefaultBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultBackgroundView()
    }
}
