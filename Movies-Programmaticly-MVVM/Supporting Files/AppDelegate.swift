//
//  AppDelegate.swift
//  Movies-Programmaticly-MVVM
//
//  Created by Ali Demirtaş on 11.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = createTabbar()
        return true
    }

 
    
    func popularTabbar() -> UINavigationController {
        let popular = PopularViewController()
        popular.title = "Popular"
        popular.tabBarItem = UITabBarItem(title: "Popular", image: .add, tag: 0)
        return UINavigationController(rootViewController: popular)
    }
    func topRatedTabbar() -> UINavigationController {
        let topRated = TopRatedViewController()
        topRated.title = "Top Rated"
        topRated.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        return UINavigationController(rootViewController: topRated)
    }
    func upcomingTabbar() -> UINavigationController {
        let upcoming = UpcomingViewController()
        upcoming.title = "Upcoming"
        upcoming.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        return UINavigationController(rootViewController: upcoming)
    }
    func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .red
        tabbar.viewControllers = [popularTabbar(),topRatedTabbar(),upcomingTabbar()]
        return tabbar
    }
    
}

