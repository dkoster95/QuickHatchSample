//
//  PrimaryDetailsTableViewCell.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 4/7/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import UIKit
import Models

class PrimaryDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var region: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(country: Country) {
        name.text = country.name
        capital.text = "Capital - \(country.capital)"
        region.text = "\(country.subregion), \(country.region)"
    }

}
