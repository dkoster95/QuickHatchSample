//
//  FetchCountryAPI.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import QuickHatch
import Models

public class FetchCountryAPI: FetchCountryDataProvider, GenericAPI {
    
    public var networkEnvironment: HostEnvironment
    public var path: String { return "" }
    let networkFactory: NetworkRequestFactory
    
    public init(networkEnvironment: HostEnvironment, networkRequestFactory: NetworkRequestFactory) {
        self.networkEnvironment = networkEnvironment
        networkFactory = networkRequestFactory
    }
    
    public func fetchAllCountries(completion completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        guard let url = URL(string: networkEnvironment.baseURL + "/all") else {
            completionHandler(.failure(RequestError.malformedRequest))
            return
        }
        guard let request = try? URLRequest.get(url: url,
                                                encoding: URLEncoding.default,
                                                headers: networkEnvironment.headers) else {
            completionHandler(.failure(RequestError.malformedRequest))
            return
        }
        networkFactory.array(request: request) { (result: Result<Response<[Country]>,Error>) in
            completionHandler(result.map({ $0.data }))
        }.resume()
    }
    
    public func getCountryByName(name: String, completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        
    }
    
    public func getCountryByCode(code: String, completionHandler: @escaping (Result<Country, Error>) -> Void) {
        
    }
}

public extension FetchCountryAPI {
    convenience init() {
        self.init(networkEnvironment: RestCountriesEnvornment(),
                  networkRequestFactory: QuickHatchRequestFactory(urlSession: .shared))
    }
}
