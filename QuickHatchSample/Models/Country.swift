//
//  Country.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation


struct Country: Codable {
    let name: String
    let topDomainLevel: [String]?
    let alpha2Code: String
    let callingCodes: [String]
    let capital: String
    let region: Region
    let subregion: String
    let latlng: [Double]?
    let borders: [String]?
    let currencies: [String]
    let languages: [String]
}
