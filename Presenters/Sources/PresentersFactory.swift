//
//  PresentersFactory.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import DataProviders

public class PresentersFactory {
    init(){}
    
    public class var countriesCollectionPresenter: CountriesCollectionPresenting {
        return CountriesCollectionPresenter(dataProvider: CountryDataProvider())
    }
}
