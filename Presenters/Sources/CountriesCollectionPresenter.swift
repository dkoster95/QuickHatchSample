//
//  CountriesCollectionPresenter.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import DataProviders
import Models

public protocol CountriesCollectionPresenting {
    func fetchData()
    func tapCountryItem()
    var view: CountriesCollectionView? { set get }
}

public protocol CountriesCollectionView: class {
    func loadCountries(countries: [Country])
    func showSpinner()
    func dismissSpinner()
    func showErrorMessage(message: String)
}

public class CountriesCollectionPresenter: CountriesCollectionPresenting {
    
    public weak var view: CountriesCollectionView?
    public let dataProvider: FetchCountryDataProvider
    
    public init(dataProvider: FetchCountryDataProvider) {
        self.dataProvider = dataProvider
    }
    
    public func fetchData() {
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
    
    public func tapCountryItem() {
        // push next screen
    }
    
    
    
    
}
