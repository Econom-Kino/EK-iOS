//
//  AppDelegate.swift
//  Econom-Kino
//
//  Created by Slavik on 20.03.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let moviesVM = MovieListViewModel.shared
        let cinemasVM = CinemasViewModel.shared
        
        
        print("Generating calendar..")
        moviesVM.makeCalendar()
        moviesVM.updateChoosenDateStr()
        
        print("Init Fetching movies...")
        moviesVM.fetchMovies(day: moviesVM.week[moviesVM.chosenDate].day,
                             month: moviesVM.week[moviesVM.chosenDate].month,
                             year: moviesVM.week[moviesVM.chosenDate].year)
        
        
        print("Init Fetching cinemas")
        cinemasVM.fetchCinemas()
        
        print("Init Fetching cinema images")
        cinemasVM.fetchCinemaImages()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

