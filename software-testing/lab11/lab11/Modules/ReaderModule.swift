//
//  ReaderModule.swift
//  lab11
//
//  Created by Eugene Ned on 22.05.2023.
//

import Foundation
import SwiftCSV

class ReaderModule {
    private var books = [Book]()
    
    func readData(from fileName: String) -> [Book]? {
        let csvURL = URL(fileURLWithPath: "/Users/kazzer/Documents/MacBook Pro - Eugene/studying/university-labs/software-testing/lab11/\(fileName).csv")
        
        if let data = try? CSV<Named>(url: csvURL) {
            for row in data.rows{
                if let code = row["Code"],
                   let authorLastName = row["Author Last Name"],
                   let title = row["Title"],
                   let releaseYearString = row["Release Year"],
                   let releaseYear = Int(releaseYearString) {
                    let book = Book(code: code,
                                    authorLastName: authorLastName,
                                    title: title,
                                    releaseYear: releaseYear)
                    
                    books.append(book)
                }
            }
        } else {
            print("Failed to read file")
            return nil
        }
        
        return books
    }
}
