//
//  OutputModule.swift
//  lab10
//
//  Created by Eugene Ned on 20.05.2023.
//

import Foundation

class OutputModule {
    func printResults(arrayB: [Int], sortedArray: [Int]) {
        print("\nSize of Array B: \(arrayB.count)")
        print("Array B: \(arrayB)")
        print("Sorted array B: \(sortedArray)")
    }
}

class OutputModuleStub: OutputModule {
    override func printResults(arrayB: [Int], sortedArray: [Int]) {
        print("Array B(stub): \(arrayB)")
    }
}
