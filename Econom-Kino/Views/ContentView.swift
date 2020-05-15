//
//  ContentView.swift
//  Econom-Kino
//
//  Created by Yaroslav Kukhar on 20.03.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.darkGray
    }
    
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Image("afishaIcon")
                        .font(.title)
                    Text("Афіша")
                }.tag(0)
            
            Text("Анонси")
                .tabItem {
                    Image("announcesIcon")
                        .font(.title)
                    Text("Анонси")
                }.tag(1)
            
            Text("Кінотеатри")
                .tabItem {
                    Image("cinemasIcon")
                        .font(.title)
                    Text("Кінотеатри")
                }.tag(2)
            
            Text("Налаштування")
                .tabItem {
                    Image("settingsIcon")
                        .font(.title)
                    Text("Налаштування")
                }.tag(3)
        }.accentColor(Color.mainOrange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
