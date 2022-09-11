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
        
           self.window = UIWindow(frame: UIScreen.main.bounds)
           let nav1 = UINavigationController()
           let mainView = MainViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
           nav1.viewControllers = [mainView]
           self.window!.rootViewController = nav1
           self.window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        return true
    }

}

