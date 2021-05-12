//
//  DataSourceLoadableCell.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 5/11/21.
//  Copyright © 2021 Daniel Koster. All rights reserved.
//

import UIKit
import Combine

public protocol DataSourceLoadableCell: UITableViewCell {
    associatedtype DataSourceType
    func load(data: DataSourceType)
}
