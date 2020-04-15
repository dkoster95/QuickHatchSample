//
//  FetchCountryDataProviderMock.swift
//  DataProvidersMocks
//
//  Created by Daniel Koster on 4/15/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import DataProviders
import Models

public class FetchCountryDataProviderMock: FetchCountryDataProvider {
    
    public init() {
        
    }
    
    public var fetchAllCountriesResult: Result<[Country], Error> = .failure(DataProviderMockError.unknownError)
    public func fetchAllCountries(completion completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        completionHandler(fetchAllCountriesResult)
    }
    public var getCountryByNameResult: Result<[Country], Error> = .failure(DataProviderMockError.unknownError)
    public func getCountryByName(name: String, completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        completionHandler(getCountryByNameResult)
    }
    public var getCountryByCodeResult: Result<[Country], Error> = .failure(DataProviderMockError.unknownError)
    public func getCountryByCode(code: String, completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        completionHandler(getCountryByCodeResult)
    }
    
    
}

public enum DataProviderMockError: Error {
    case unknownError
}
