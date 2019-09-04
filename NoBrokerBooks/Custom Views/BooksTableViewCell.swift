//
//  BooksTableViewCell.swift
//  NoBrokerBooks
//
//  Created by Anuj Rajput on 04/09/19.
//  Copyright © 2019 NoBroker. All rights reserved.
//

import UIKit
import AlamofireImage

class BooksTableViewCell: UITableViewCell {

    // MARK: - UI Outlets
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var author: UILabel!
    @IBOutlet var genre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 }

extension BooksTableViewCell: ReusableCellProtocol {
    static func configureCell<T>(tableView: UITableView, indexPath: IndexPath, object: T?) -> UITableViewCell {
        guard let book = object as? Book, let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? BooksTableViewCell else { fatalError(Constants.Errors.cellDequeue) }
        
        cell.profileImage.af_setImage(withURL: book.imageURL)
        cell.title.text = book.title
        cell.author.text = book.author
        cell.genre.text = book.genre
        
        return cell
    }
}
