//
//  CountriesCollectionPresenterTests.swift
//  PresentersTests
//
//  Created by Daniel Koster on 4/15/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import XCTest
@testable import Presenters
import DataProvidersMocks
import Models

class CountriesCollectionPresenterTests: XCTestCase {
    var subject: CountriesCollectionPresenter!
    var view: CountriesCollectionViewMock!
    let dataProviderMock = FetchCountryDataProviderMock()
    let helpers = PresentersTests.Helpers()
    
    override func setUp() {
        view = CountriesCollectionViewMock()
        subject = CountriesCollectionPresenter(dataProvider: dataProviderMock)
        subject.view = view
    }
    
    func testSpinnerShownAndDismissed() {
        dataProviderMock.fetchAllCountriesResult = .failure(DataProviderMockError.unknownError)
        subject.fetchData()
        XCTAssertTrue(view.spinnerShown)
        XCTAssertTrue(view.spinnerDismissed)
    }
    
    func testErrorWhileLoadingData() {
        dataProviderMock.fetchAllCountriesResult = .failure(DataProviderMockError.unknownError)
        subject.fetchData()
        XCTAssertTrue(view.errorMessageShown)
    }
    
    func testSuccessWhileLoadingData() {
        dataProviderMock.fetchAllCountriesResult = .success(helpers.loadCountries())
        subject.fetchData()
        XCTAssertTrue(view.loadCountriesCalled)
    }
    
    func testSuccessWhileSearchingCountry() {
        dataProviderMock.getCountryByNameResult = .success(helpers.loadCountries())
        subject.searchCountry(name: "")
        XCTAssertTrue(view.loadCountriesCalled)
    }
    
    func testTapAction() {
        subject.tapCountryItem(country: helpers.loadCountries()[0])
        XCTAssertTrue(view.detailLoaded)
    }
}
