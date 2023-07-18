//
//  Player.swift
//  NBAtask
//
//  Created by Viktor Krastev on 16.07.23.
//

import Foundation

struct Player: Codable {
    let firstName: String
    let lastName: String
    let position: String
    let heightFeet: Double?
    let heightInches: Double?
    let weightPounds: Double?
    let team: Team
    
    struct Team: Codable {
        let fullName: String
        let city: String
        let conference: String
        let division: String
    }
}
