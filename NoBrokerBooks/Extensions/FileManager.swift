//
//  FileManager.swift
//  NoBrokerBooks
//
//  Created by Anuj Rajput on 04/09/19.
//  Copyright © 2019 NoBroker. All rights reserved.
//

import Foundation

extension FileManager {
    
    static func getBooksFromStub() -> [Book]? {
        guard let fileURL = Bundle.main.url(forResource: Constants.Files.books, withExtension: "json") else { return nil }
        guard let data = try? Data(contentsOf: fileURL) else { return nil }
        
        let response = try? JSONDecoder().decode([Book].self, from: data)
        return response
    }
}
