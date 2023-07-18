//
//  SeasonAveragesResponseModel.swift
//  NBAtask
//
//  Created by Viktor Krastev on 19.07.23.
//

import Foundation

struct SeasonAveragesResponseModel: Codable {
    let data: [SeasonAveragesData]
}

struct SeasonAveragesData: Codable {
    let seasonYear: Int
    let gamesPlayed: Int
    let points: Double
    
    enum CodingKeys: String, CodingKey {
        case seasonYear = "season"
        case gamesPlayed 
        case points = "pts"
    }
}
