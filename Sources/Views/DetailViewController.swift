//
//  DetailViewController.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 4/7/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import UIKit
import Models
import Presenters

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var country: Country?
    var presenter: CountryDetailPresenting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let borders = country?.borders, !borders.isEmpty {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : country!.borders!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstDetailsCell") as? PrimaryDetailsTableViewCell
            cell?.configure(country: country!)
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell") as? MapTableViewCell
            cell?.configure(latitude: country!.latlng![0], longitude: country!.latlng![1], name: country!.name)
            return cell!
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondaryDetailsCell") as? SecondaryDetailsTableViewCell
            cell?.configure(country: country!)
            return cell!
        }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "borderCell") as? BorderTableViewCell
        cell?.configure(code: country!.borders![indexPath.row], presenter: presenter!)
//        cell?.name.text = country!.borders![indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 40
        }
        switch indexPath.row {
        case 0: return 160
        case 1: return 160
        default: return 160
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Borders"
        }
        return ""
    }

}


extension UIStoryboard {
    static func detailViewController(country: Country) -> UIViewController {
        let detailViewController = UIStoryboard.init(name: "Main", bundle: .main).instantiateViewController(identifier: "Details") as? DetailViewController
        detailViewController?.country = country
        detailViewController?.presenter = CountryDetailPresenter()
        return detailViewController!
    }
}
