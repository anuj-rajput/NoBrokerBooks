//
//  ReusableCell.swift
//  NoBrokerBooks
//
//  Created by Anuj Rajput on 04/09/19.
//  Copyright © 2019 NoBroker. All rights reserved.
//

import UIKit

protocol ReusableCellProtocol {}

extension ReusableCellProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

protocol ReusableTableViewCellProtocol: ReusableCellProtocol {
    static func configureCell<T>(tableView: UITableView, indexPath:IndexPath, object: T?) -> UITableViewCell
}
