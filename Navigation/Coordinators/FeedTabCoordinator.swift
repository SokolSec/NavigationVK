//
//  FeedTabBarCoordinator.swift
//  Navigation
//
//  Created by mitr on 15.06.2022.
//

import UIKit

final class FeedTabCoordinator: NSObject, CoordinatorProtocol {
    
    var rootViewController: UINavigationController
    
    private let feedViewController = FeedViewController()
        
    
    override init() {
        rootViewController = UINavigationController()
        super.init()
        feedViewController.showDetailRequested = {[weak self] in
            self?.goToDetail()
        }
    }
    
    
    func start() {
        rootViewController.setViewControllers([feedViewController], animated: false)
    }
    
    func goToDetail() {
        let infoViewController = InfoViewController()
        rootViewController.pushViewController(infoViewController, animated: true)
    }
}