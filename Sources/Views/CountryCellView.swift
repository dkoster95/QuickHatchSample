//
//  CountryCellView.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import UIKit
import Models

class CountryCellView: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var subregion: UILabel!
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var regionColor: UIView!
    
    func setCountry(country: Country) {
        name.text = country.name
        region.text = country.region.rawValue
        subregion.text = country.subregion
        code.text = country.alpha2Code
        currency.text = country.currencies[0]
        regionColor.backgroundColor = country.region.color
    }
    
}
