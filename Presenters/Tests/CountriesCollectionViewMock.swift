//
//  CountriesCollectionViewMock.swift
//  PresentersTests
//
//  Created by Daniel Koster on 4/15/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import Presenters
import Models

class CountriesCollectionViewMock: CountriesCollectionView {
    
    public var loadCountriesCalled = false
    public  var countriesLoaded: [Country] = []
    func loadCountries(countries: [Country]) {
        loadCountriesCalled.toggle()
        countriesLoaded = countries
    }
    
    public var spinnerShown = false
    func showSpinner() {
        spinnerShown.toggle()
    }
    
    public var spinnerDismissed = false
    func dismissSpinner() {
        spinnerDismissed.toggle()
    }
    
    public var errorMessageShown = false
    func showErrorMessage(message: String) {
        errorMessageShown.toggle()
    }
    
    public var detailLoaded = false
    func loadDetails(for country: Country) {
        detailLoaded.toggle()
    }
    
    
}
