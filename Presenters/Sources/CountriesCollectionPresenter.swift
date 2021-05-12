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
    func tapCountryItem(country: Country)
    var view: CountriesCollectionView? { set get }
    func searchCountry(name: String)
}

public protocol CountriesCollectionView: class {
    func loadCountries(countries: [Country])
    func showSpinner()
    func dismissSpinner()
    func showErrorMessage(message: String)
    func loadDetails(for country: Country)
}

public class CountriesCollectionPresenter: CountriesCollectionPresenting {
    
    public weak var view: CountriesCollectionView?
    public let dataProvider: CountryDataProviderProtocol
    
    public init(dataProvider: CountryDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    public func fetchData() {
        view?.showSpinner()
        dataProvider.getAll { [weak self] (result: Result<[Country],Error>) in
            self?.view?.dismissSpinner()
            switch result {
            case .success(let countries):
                self?.view?.loadCountries(countries: countries)
            case .failure(let error):
                self?.view?.showErrorMessage(message: "Server not Available right now try again or wait \(error)")
            }
        }
    }
    
    public func tapCountryItem(country: Country) {
        // push next screen
        view?.loadDetails(for: country)
    }
    
    public func searchCountry(name: String) {
        print("serach country \(name)")
        dataProvider.getBy(name: name) { [weak self] (result: Result<[Country], Error>) in
            switch result {
            case .success(let countries):
                self?.view?.loadCountries(countries: countries)
            case .failure(let error):
                print(error)
            }
        }
    }

}
