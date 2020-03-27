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
    }
    
    func showErrorMessage(message: String) {
        
    }
    var presenter: CountriesCollectionPresenting = PresentersFactory.countriesCollectionPresenter

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        self.presenter.view = self
        refreshControl.beginRefreshing()
        presenter.fetchData()
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


}

