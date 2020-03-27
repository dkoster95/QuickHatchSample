//
//  PresentersFactory.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation


class PresentersFactory {
    init(){}
    
    class var countriesCollectionPresenter: CountriesCollectionPresenting {
        return CountriesCollectionPresenter(dataProvider: FetchCountryAPI())
    }
}
