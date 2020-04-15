//
//  PresentersTests.swift
//  PresentersTests
//
//  Created by Daniel Koster on 3/26/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import Foundation
import Models

class PresentersTests {
    class Helpers {
        func loadCountries() -> [Country] {
            let jsonFile = Bundle(for: type(of:self)).path(forResource: "Countries", ofType: "json")
            let content = try! Data(contentsOf: URL(fileURLWithPath: jsonFile!), options: .alwaysMapped)
            return try! JSONDecoder().decode([Country].self, from: content)
        }
    }
}
