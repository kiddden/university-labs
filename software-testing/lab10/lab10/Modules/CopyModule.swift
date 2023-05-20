//
//  CopyModule.swift
//  lab10
//
//  Created by Eugene Ned on 20.05.2023.
//

import Foundation

class CopyModule {
    func getEvenNumbers(inputArray: [Int]) -> [Int] {
        var outputArray = [Int]()
        for num in inputArray {
            if num % 2 == 0 {
                outputArray.append(num)
            }
        }
        return outputArray
    }
}

class CopyModuleStub: CopyModule {
    override func getEvenNumbers(inputArray: [Int]) -> [Int] {
        return inputArray
    }
}
