//
//  lab11FrameworkTests.swift
//  lab11FrameworkTests
//
//  Created by Eugene Ned on 22.05.2023.
//

import XCTest
@testable import lab11Framework

final class lab11FrameworkTests: XCTestCase {
    
    let books = [
        Book(code: "001", authorLastName: "Test1", title: "Harry Potter and Test1", releaseYear: 1997),
        Book(code: "002", authorLastName: "Test2", title: "Harry Potter and Test2", releaseYear: 2000),
        Book(code: "003", authorLastName: "Test3", title: "Harry Potter and Test3", releaseYear: 2005),
        Book(code: "004", authorLastName: "Test4", title: "Harry Potter and Test4", releaseYear: 2023),
        Book(code: "005", authorLastName: "Test4", title: "Harry Potter and Test444", releaseYear: 2024)
    ]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReaderModule() throws {
        let reader = ReaderModule()
        if let data = reader.readData(from: "Library") {
            XCTAssertFalse(data.isEmpty)
        } else {
            XCTFail("Couldn't read data")
        }
    }
    
    func testLibraryModuleGetListOfBooksFunc() throws {
        let library = LibraryModule()
        
        let listOfBooksByTest4 = library.getListOfBooks(by: "Test4", in: books)
        
        XCTAssertEqual(listOfBooksByTest4?.count, 2)
    }
    
    func testLibraryModuleGetNumberOfBooksAfterYearFunc() throws {
        let library = LibraryModule()
        
        let numberOfBooks = library.getNumberOfBooksAfter(year: 2000, in: books)
        
        XCTAssertEqual(numberOfBooks, 3)
    }
}
