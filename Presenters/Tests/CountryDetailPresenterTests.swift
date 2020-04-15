//
//  CountryDetailPresenterTests.swift
//  PresentersTests
//
//  Created by Daniel Koster on 4/15/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import XCTest
@testable import Presenters
import DataProvidersMocks
import Models

class CountryDetailPresenterTests: XCTestCase {
    
    var subject: CountryDetailPresenter!
    let dataProviderMock = FetchCountryDataProviderMock()
    let helpers = PresentersTests.Helpers()
    override func setUp() {
        subject = CountryDetailPresenter(fetchCountryDataProvider: dataProviderMock)
    }
    
    func testBordersLoadError() {
        dataProviderMock.getCountryByCodeResult = .failure(DataProviderMockError.unknownError)
        subject.getCountryByCode(code: "") { country in
            XCTAssertNil(country)
        }
    }

    func testBordersLoad() {
        dataProviderMock.getCountryByCodeResult = .success(helpers.loadCountries())
        subject.getCountryByCode(code: "") { country in
            XCTAssertNotNil(country)
        }
    }

}
