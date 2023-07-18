//
//  MainCoordinator.swift
//  NBAtask
//
//  Created by Viktor Krastev on 16.07.23.
//

import UIKit

enum Screen {
    case HomeScreen
    case AboutScreen
}

class MainCoordinator: MainBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    
    lazy var homeCoordinator: HomeBaseCoordinator = HomeCoordinator()
    lazy var aboutCoordinator: AboutBaseCoordinator = AboutCoordinator()
    
    lazy var rootViewController: UIViewController = UITabBarController()
    
    func start() -> UIViewController {
        
        let homeViewController = homeCoordinator.start()
        homeCoordinator.parentCoordinator = self
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 0)
        
        let aboutViewController = aboutCoordinator.start()
        aboutCoordinator.parentCoordinator = self
        aboutViewController.tabBarItem = UITabBarItem(title: "About", image: UIImage(systemName: "doc.plaintext"), tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [homeViewController,aboutViewController]
        
        return rootViewController
    }
    
    func moveTo(screen: Screen) {
        switch screen {
        case .HomeScreen:
            (rootViewController as? UITabBarController)?.selectedIndex = 0
        case .AboutScreen:
            (rootViewController as? UITabBarController)?.selectedIndex = 1
        }
    }
    
    func resetToRoot() -> Self {
        homeCoordinator.resetToRoot()
        return self
    }
}
