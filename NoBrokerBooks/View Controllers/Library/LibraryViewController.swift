//
//  LibraryViewController.swift
//  NoBrokerBooks
//
//  Created by Anuj Rajput on 04/09/19.
//  Copyright © 2019 NoBroker. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    // MARK: UI Outlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - State
    var books: [Book] = []
    var authors: [String:[Book]] = [:]
    var genres: [String:[Book]] = [:]
    var countries: [String:[Book]] = [:]
    var array: [String] = []
    
    // MARK: - View Hierarchy
    override func loadView() {
        super.loadView()
        loadTableView()
        loadUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        sortAndFilterData()
    }
    
    // MARK: - Private Methods
    private func loadTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ReuseIdentifiers.LibraryTableViewCell)
    }
    
    private func loadUI() {
        navigationItem.title = NSLocalizedString("Books Library", comment: "")
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func loadData() {
        if let books = FileManager.getBooksFromStub() {
            self.books = books
        }
    }
    
    private func sortAndFilterData() {
        authors = Dictionary(grouping: books, by: { $0.author })
        genres = Dictionary(grouping: books, by: { $0.genre })
        countries = Dictionary(grouping: books, by: { $0.country })
        
        let author = Array<String>(authors.keys)
        let country = Array<String>(countries.keys)
        let genre = Array<String>(genres.keys)
        array = Array<String>(author + country + genre)
    }
}
