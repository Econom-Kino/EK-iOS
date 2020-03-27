//
//  ContentView.swift
//  Econom-Kino
//
//  Created by Yaroslav Kukhar on 20.03.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        ZStack {
            Color.mainGray
            .edgesIgnoringSafeArea(.all)
            
            HStack (spacing: 20) {
                Text("HW")
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
