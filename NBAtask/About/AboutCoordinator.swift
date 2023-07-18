//
//  AboutCoordinator.swift
//  NBAtask
//
//  Created by Viktor Krastev on 16.07.23.
//

import UIKit

class AboutCoordinator: AboutBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: AboutViewController(coordinator: self))
        return rootViewController
    }
    
}
