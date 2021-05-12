//
//  SearchBarModel.swift
//  QuickHatchSample
//
//  Created by Daniel Koster on 4/7/20.
//  Copyright © 2020 Daniel Koster. All rights reserved.
//

import UIKit
import Presenters

class SearchBarModel: NSObject, UISearchBarDelegate {
    private let searchBar: UISearchBar
    private var timer: Timer? = nil
    private let action: (String) -> ()
    
    init(searchBar: UISearchBar, action: @escaping (String) -> ()) {
        self.searchBar = searchBar
        self.action = action
        super.init()
        self.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        throttle(after: 0.3) { [weak self] in
            self?.action(searchText)
        }
    }
    
    private func throttle(after: TimeInterval, handler: @escaping  () -> Void) {
        timer?.invalidate()
        timer = nil
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { timer in
            handler()
        }
    }
}
