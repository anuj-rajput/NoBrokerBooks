//
//  BooksViewController+Extensions.swift
//  NoBrokerBooks
//
//  Created by Anuj Rajput on 04/09/19.
//  Copyright © 2019 NoBroker. All rights reserved.
//

import UIKit

extension BooksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = filteredBooks[indexPath.row]
        return BooksTableViewCell.configureCell(tableView: tableView, indexPath: indexPath, object: book)
    }
}

extension BooksViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty == false {
            filteredBooks = books.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        } else {
            filteredBooks = books
        }
        
        tableView.reloadData()
    }
}
