//
//  HomeCoordinator.swift
//  NBAtask
//
//  Created by Viktor Krastev on 16.07.23.
//

import UIKit

class HomeCoordinator: HomeBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: HomeViewController(coordinator: self))
        return rootViewController
    }
    
    func goToPlayerDetails(player: Player) {
        let storyboard = UIStoryboard(name: "PlayerDetails", bundle: nil)
        let playerDetailsViewController = storyboard.instantiateInitialViewController() as! PlayerDetailsViewController
        playerDetailsViewController.coordinator = self
        playerDetailsViewController.player = player
        navigationRootViewController?.pushViewController(playerDetailsViewController, animated: false)
        
    }
    
    func goToSecondDetailsScreen(seasonAverages: [SeasonAveragesData]) {
        let storyboard = UIStoryboard(name: "SecondDetailsScreen", bundle: nil)
        let secondetailsViewController = storyboard.instantiateInitialViewController() as! SecondDetailsViewController
        secondetailsViewController.coordinator = self
        secondetailsViewController.seasonAverages = seasonAverages
        navigationRootViewController?.pushViewController(secondetailsViewController, animated: false)
    }
}

