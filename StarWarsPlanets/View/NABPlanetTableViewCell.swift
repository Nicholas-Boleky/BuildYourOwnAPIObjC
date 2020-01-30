//
//  NABPlanetTableViewCell.swift
//  StarWarsPlanets
//
//  Created by Nicholas Boleky on 1/30/20.
//  Copyright © 2020 Nicholas Boleky. All rights reserved.
//

import UIKit

class NABPlanetTableViewCell: UITableViewCell {

    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var planetClimateLabel: UILabel!
    @IBOutlet weak var planetTerrainLabel: UILabel!
    
    var planet: NABPlanet? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        guard let planet = planet else { return }
        planetNameLabel.text = planet.name
        planetClimateLabel.text = planet.climate
        planetTerrainLabel.text = planet.terrain
    }
    
}
