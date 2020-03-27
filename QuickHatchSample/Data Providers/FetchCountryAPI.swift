//
//  FetchCountryAPI.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import QuickHatch

class FetchCountryAPI: FetchCountryDataProvider, GenericAPI {
    
    var networkEnvironment: HostEnvironment
    var path: String { return "" }
    let networkFactory: NetworkRequestFactory
    
    init(networkEnvironment: HostEnvironment, networkRequestFactory: NetworkRequestFactory) {
        self.networkEnvironment = networkEnvironment
        networkFactory = networkRequestFactory
        networkFactory.log(with: log)
    }
    
    func fetchAllCountries(completion completionHandler: @escaping (Result<[Country], Error>) -> Void) {
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
    
    func getCountryByName(name: String, completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        
    }
    
    func getCountryByCode(code: String, completionHandler: @escaping (Result<Country, Error>) -> Void) {
        
    }
}

extension FetchCountryAPI {
    convenience init(networkRequestFactory: NetworkRequestFactory = QuickHatchRequestFactory(urlSession: .shared)) {
        self.init(networkEnvironment: RestCountriesEnvornment(),
                  networkRequestFactory: networkRequestFactory)
    }
}
