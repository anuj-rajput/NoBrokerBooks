//
//  BooksViewController.swift
//  NoBrokerBooks
//
//  Created by Anuj Rajput on 04/09/19.
//  Copyright © 2019 NoBroker. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet var tableView: UITableView! {
        didSet {
            let cell = BooksTableViewCell.self
            tableView.register(cell.nib, forCellReuseIdentifier: cell.identifier)
            tableView.dataSource = self
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = UITableView.automaticDimension
            tableView.sectionHeaderHeight = UITableView.automaticDimension
            tableView.tableFooterView = UIView()
        }
    }
    
    lazy var searchBar: UISearchBar = UISearchBar()
    
    // MARK: - State
    var books: [Book]!
    var filteredBooks: [Book]!
    
    // MARK: - Initializer
    func configure(with books: [Book]) {
        self.books = books
        self.filteredBooks = books
    }
    
    // MARK: - View Hierarchy
    override func loadView() {
        super.loadView()
        setupSearchBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private Methods
    private func setupSearchBar() {
        searchBar.searchBarStyle = .prominent
        searchBar.placeholder = "Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
}
