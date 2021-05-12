//
//  FetchCountryAPI.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import CountriesAPI
import Models

public class CountryDataProvider: CountryDataProviderProtocol {
    private let api: CountryAPIProtocol
    
    public init(api: CountryAPIProtocol) {
        self.api = api
    }
    
    public func getAll(completion completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        api.getAll(completion: completionHandler)
    }
    
    public func getBy(name: String, completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        api.getBy(name: name, completionHandler: completionHandler)
    }
    
    public func getBy(code: String, completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        api.getBy(code: code, completionHandler: completionHandler)
    }

}

public extension CountryDataProvider {
    convenience init() {
        self.init(api:  CountryAPI())
    }
}
