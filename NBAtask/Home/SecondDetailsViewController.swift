//
//  SecondDetailsViewController.swift
//  NBAtask
//
//  Created by Viktor Krastev on 19.07.23.
//

import UIKit

class SecondDetailsViewController: UIViewController {

    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var seasonValueLabel: UILabel!
    @IBOutlet weak var gamesPlayedlabel: UILabel!
    @IBOutlet weak var gamesPlayedValueLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var pointsValueLabel: UILabel!
    
    var coordinator: HomeBaseCoordinator?
    var seasonAverages: [SeasonAveragesData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Additional details"
        self.setupTexts()
    }
    
    private func setupTexts() {
        guard let seasonAverages = self.seasonAverages?.first else { return }
        self.seasonLabel.text = "Season:"
        self.seasonValueLabel.text = seasonAverages.seasonYear.description
        self.gamesPlayedlabel.text = "Games played:"
        self.gamesPlayedValueLabel.text = seasonAverages.gamesPlayed.description
        self.pointsLabel.text = "Points:"
        self.pointsValueLabel.text = seasonAverages.points.description
    }
}
