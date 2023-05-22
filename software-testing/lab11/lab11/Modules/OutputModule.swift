//
//  OutputModule.swift
//  lab11
//
//  Created by Eugene Ned on 22.05.2023.
//

import Foundation

class OutputModule {
    
    func display(_ books: [Book]) {
        print("List of all books in the library: ")
        
        for book in books {
            print("Code: \(book.code) | Author Last Name: \(book.authorLastName) | Title: \(book.title) | Release Year: \(book.releaseYear)")
        }
    }
    
    func display(books: [Book], by author: String, number: Int, afterYear year: Int) {
        print("\nBooks by \(author):")
        
        for book in books {
            print("Code: \(book.code) | Title: \(book.title) | Release Year: \(book.releaseYear)")
        }
        
        print("\nNumber of books published after \(year) - \(number)")
    }
}
