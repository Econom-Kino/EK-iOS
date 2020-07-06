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
        NavigationView {
            TabView {
                MovieListView()
                    .tabItem {
                        Image("afishaIcon")
                            .font(.system(size: 32))
                        Text("Афіша")
                    }.tag(0)
                
                Text("Анонси")
                    .tabItem {
                        Image("anouncesIcon")
                             .font(.system(size: 32))
                        Text("Анонси")
                    }.tag(1)
                
                NavigationView { CinemaListView() }
                    .navigationBarHidden(true)
                    .tabItem {
                        Image("cinemasIcon")
                             .font(.system(size: 32))
                        Text("Кінотеатри")
                    }
                .tag(2)
                
                Text("Налаштування")
                    .tabItem {
                        Image("settingsIcon")
                            .font(.system(size: 32))
                        Text("Налаштування")
                    }.tag(3)
            }
        }.navigationBarTitle("Cinemas")
         .navigationBarHidden(true)
         .accentColor(Color.mainOrange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
