//
//  PlayerTableViewCell.swift
//  NBAtask
//
//  Created by Viktor Krastev on 16.07.23.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerNamesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
}
