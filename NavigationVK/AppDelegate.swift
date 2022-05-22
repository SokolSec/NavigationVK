//
//  AppDelegate.swift
//  Navigation
//
//  Created by Даниил Сокол on 11.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController = UITabBarController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        let feedVC = FeedViewController()
        let feedNavigationController = UINavigationController(rootViewController: feedVC)
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "star"), tag: 0)
        
        let profileVC = LogInViewController()
        let profileNavigationViewController = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)
        
        tabBarController.viewControllers = [feedNavigationController, profileNavigationViewController]        
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.selectedIndex = 1
        return true
    }
}
