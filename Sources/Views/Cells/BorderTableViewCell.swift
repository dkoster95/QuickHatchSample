//
//  BorderTableViewCell.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 4/7/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import UIKit
import Presenters

class BorderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var name: UILabel!
    
    func configure(code: String, presenter: CountryDetailPresenting) {
        name.text = "--"
        presenter.getCountryByCode(code: code) { [weak self] country in
            self?.name.text = country?.name
        }
    }

}
