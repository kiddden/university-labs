//
//  main.swift
//  lab11
//
//  Created by Eugene Ned on 22.05.2023.
//

import Foundation

class MainModule {
    private let reader: ReaderModule
    private let library: LibraryModule
    private let output: OutputModule

    init() {
        self.reader = ReaderModule()
        self.library = LibraryModule()
        self.output = OutputModule()
    }

    func run() {
        let author = "Orwell"
        let year = 1900
        
        if let data = reader.readData(from: "Library") {
            output.display(data)
            
            let listOfBooksByOrwell = library.getListOfBooks(by: author, in: data)
            let numberOfBooksAfter1900 = library.getNumberOfBooksAfter(year: year, in: data)

            if let list = listOfBooksByOrwell, let number = numberOfBooksAfter1900 {
                output.display(books: list, by: author, number: number, afterYear: year)
            }
        }
    }
}

let main = MainModule()
main.run()
