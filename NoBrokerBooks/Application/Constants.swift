//
//  Constants.swift
//  NoBrokerBooks
//
//  Created by Anuj Rajput on 04/09/19.
//  Copyright © 2019 NoBroker. All rights reserved.
//

import Foundation

enum Constants {
    
    enum Strings {
    }
    
    enum ReuseIdentifiers {
        static let LibraryTableViewCell = "LibraryTableViewCell"
        static let BookTableViewCell = "BookTableViewCell"
    }
    
    enum Errors {
        static let cellDequeue = NSLocalizedString("UITableViewCell couldn't be dequeued.", comment: "")
    }
    
    enum Files {
        static let books = "books"
    }
}
