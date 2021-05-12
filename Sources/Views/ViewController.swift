//
//  ViewController.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 3/19/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import UIKit
import Presenters
import Models

class ViewController: UIViewController, CountriesCollectionView, UITableViewDelegate, UITableViewDataSource {
    private var countries: [Country] = []
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    @IBOutlet weak var searchBar: UISearchBar!
    private var searchBarModel: SearchBarModel!
    
    
    func loadCountries(countries: [Country]) {
        print(countries)
        refreshControl.endRefreshing()
        self.countries = countries
        tableView.reloadData()
    }
    
    func showSpinner() {
        print("show spinner")
    }
    
    func dismissSpinner() {
        print("dismiss spinner")
        refreshControl.endRefreshing()
    }
    
    func showErrorMessage(message: String) {
        
    }
    
    func loadDetails(for country: Country) {
        let details = UIStoryboard.detailViewController(country: country)
        navigationController?.pushViewController(details, animated: true)
    }
    
    var presenter: CountriesCollectionPresenting = PresentersFactory.countriesCollectionPresenter

    override func viewDidLoad() {
        super.viewDidLoad()
        configureRefreshControl()
        tableView.tableFooterView = UIView()
        presenter.view = self
        refreshControl.beginRefreshing()
        presenter.fetchData()
        configureSeachBar()
    }
    
    private func configureRefreshControl() {
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
    }
    private func configureSeachBar() {
        searchBarModel = SearchBarModel(searchBar: searchBar) { [weak self] searchText in
            searchText.isEmpty ? self?.presenter.fetchData() : self?.presenter.searchCountry(name: searchText)
        }
    }
    
    @objc func refresh(sender:AnyObject) {
        refreshControl.beginRefreshing()
        presenter.fetchData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCellView
        cell?.setCountry(country: countries[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.tapCountryItem(country: countries[indexPath.row])
    }

}

