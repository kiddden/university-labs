//
//  SortModule.swift
//  lab10
//
//  Created by Eugene Ned on 20.05.2023.
//

import Foundation

class SortModule {
    func sortArray(inputArray: [Int]) -> [Int] {
        return inputArray.sorted()
    }
}

class SortModuleStub: SortModule {
    override func sortArray(inputArray: [Int]) -> [Int] {
        return inputArray
    }
}
