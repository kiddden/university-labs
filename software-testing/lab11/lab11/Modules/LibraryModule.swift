//
//  LibraryModule.swift
//  lab11
//
//  Created by Eugene Ned on 22.05.2023.
//

import Foundation

class LibraryModule {
    
    func getListOfBooks(by author: String, in listOfAllBooks: [Book]) -> [Book]? {
        return listOfAllBooks.filter { $0.authorLastName == author }
    }
    
    func getNumberOfBooksAfter(year: Int, in listOfAllBooks: [Book]) -> Int? {
        return listOfAllBooks.filter { $0.releaseYear > year }.count
    }
}
