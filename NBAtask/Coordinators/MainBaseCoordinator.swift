//
//  MainBaseCoordinator.swift
//  NBAtask
//
//  Created by Viktor Krastev on 16.07.23.
//

import Foundation

protocol MainBaseCoordinator: Coordinator {
    var homeCoordinator: HomeBaseCoordinator { get }
    var aboutCoordinator: AboutBaseCoordinator { get }
    func moveTo(screen: Screen)
}

protocol HomeBaseCoordinated {
    var coordinator: HomeBaseCoordinator? { get }
}

protocol AboutBaseCoordinated {
    var coordinator: AboutBaseCoordinator? { get }
}
