//
//  SecondaryDetailsTableViewCell.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 4/7/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Models
import UIKit

class SecondaryDetailsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var languages: UILabel!
    @IBOutlet weak var currencies: UILabel!
    
    func configure(country: Country) {
        population.text = "Population: \(country.populationFormatted)"
        languages.text = "Languages: \(country.languagesString)"
        currencies.text = "Currencies: \(country.currenciesString)"
    }
    

}
