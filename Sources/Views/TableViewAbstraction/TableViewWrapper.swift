////
////  TableViewWrapper.swift
////  QuickHatchSample
////
////  Created by Daniel Koster on 5/11/21.
////  Copyright © 2021 Daniel Koster. All rights reserved.
////
//
//import UIKit
//import Combine
//
//public class TableViewWrapper<DataSourceType>: NSObject, UITableViewDataSource, UITableViewDelegate {
//
//    private let tableView: UITableView
//    //private let dataSource: AnyPublisher<DataSourceType, Error>
//    
//    public init(tableView: UITableView) {
//        self.tableView = tableView
//    }
//    
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }
//    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! DataSourceLoadableCell
//    }
//}
//
//
//class TableViewWrapperDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
//    
//    
//    func setDataSourceCell<Type: DataSourceLoadableCell>(cell: Type) {
//        
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}
