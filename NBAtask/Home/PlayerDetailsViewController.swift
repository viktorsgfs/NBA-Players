//
//  PlayerDetailsViewController.swift
//  NBAtask
//
//  Created by Viktor Krastev on 17.07.23.
//

import UIKit

class PlayerDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var divisionLabel: UILabel!
    @IBOutlet weak var detailsInfoButton: UIButton!
    
    
    var coordinator: HomeBaseCoordinator?
    var player: Player?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTexts()
    }
    
    private func setupTexts() {
        guard let player = player else { return }
        self.firstNameLabel.text = player.firstName
        self.lastNameLabel.text = player.lastName
        self.positionLabel.text = "Position: \n \(player.position)"
        self.heightLabel.text = "Height: \n\(player.heightFeet?.description ?? "No data")"
        self.weightLabel.text = "Weight: \n\(player.weightPounds?.description ?? "No data")"
        self.teamNameLabel.text = "Weight: \n\(player.team.fullName)"
        self.cityLabel.text = "City: \n\(player.team.city)"
        self.conferenceLabel.text = "Conference: \n\(player.team.conference)"
        self.divisionLabel.text = "Division: \n\(player.team.division)"
    }
 
    @IBAction func infoButtonClicked(_ sender: Any) {
        
    }
}
