//
//  CountryDetailPresenter.swift
//  Presenters
//
//  Created by Daniel Koster on 4/15/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import Models
import DataProviders

public protocol CountryDetailPresenting {
    func getCountryByCode(code: String, onSuccess: @escaping (Country?) -> Void)
}

public class CountryDetailPresenter: CountryDetailPresenting {
    private let fetchCountryDataProvider: FetchCountryDataProvider
    
    public init(fetchCountryDataProvider: FetchCountryDataProvider) {
        self.fetchCountryDataProvider = fetchCountryDataProvider
    }
    
    public func getCountryByCode(code: String, onSuccess: @escaping (Country?) -> Void) {
        fetchCountryDataProvider.getCountryByCode(code: code) { result in
            guard let results = try? result.get(), let country = results.first else {
                onSuccess(nil)
                return
            }
            onSuccess(country)
        }
    }
    
}

public extension CountryDetailPresenter {
    convenience init() {
        self.init(fetchCountryDataProvider: FetchCountryAPI())
    }
}
