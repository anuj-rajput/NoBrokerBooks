//
//  LibraryViewController+Extensions.swift
//  NoBrokerBooks
//
//  Created by Anuj Rajput on 04/09/19.
//  Copyright © 2019 NoBroker. All rights reserved.
//

import UIKit

// MARK: - Table View Data Source
extension LibraryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authors.keys.count + countries.keys.count + genres.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: Constants.ReuseIdentifiers.LibraryTableViewCell)
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }
}

// MARK: - Table View Delegate
extension LibraryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = presentBooksScene(for: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Navigation
extension LibraryViewController {
    
    func presentBooksScene(for index: Int) -> BooksViewController {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: BooksViewController.self)) as? BooksViewController else {
            fatalError("Couldn't load books view controller")
        }
        
        if let authorBooks = authors[array[index]] {
            vc.configure(with: authorBooks)
        }
        
        if let genreBooks = genres[array[index]] {
            vc.configure(with: genreBooks)
        }
        
        if let countryBooks = countries[array[index]] {
            vc.configure(with: countryBooks)
        }
        
        return vc
    }
}
