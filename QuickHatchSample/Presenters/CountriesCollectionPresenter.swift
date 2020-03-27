//
//  CountriesCollectionPresenter.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation

protocol CountriesCollectionPresenting {
    func fetchData()
    func tapCountryItem()
    var view: CountriesCollectionView? { set get }
}

protocol CountriesCollectionView: class {
    func loadCountries(countries: [Country])
    func showSpinner()
    func dismissSpinner()
    func showErrorMessage(message: String)
}

class CountriesCollectionPresenter: CountriesCollectionPresenting {
    
    weak var view: CountriesCollectionView?
    let dataProvider: FetchCountryDataProvider
    
    init(dataProvider: FetchCountryDataProvider) {
        self.dataProvider = dataProvider
    }
    
    func fetchData() {
        view?.showSpinner()
        dataProvider.fetchAllCountries { [weak self] (result: Result<[Country],Error>) in
            self?.view?.dismissSpinner()
            switch result {
            case .success(let countries):
                self?.view?.loadCountries(countries: countries)
            case .failure(let error):
                self?.view?.showErrorMessage(message: "Server not Available right now try again or wait \(error)")
            }
        }
    }
    
    func tapCountryItem() {
        // push next screen
    }
    
    
    
    
}
