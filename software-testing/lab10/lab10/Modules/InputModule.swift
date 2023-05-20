//
//  InputModule.swift
//  lab10
//
//  Created by Eugene Ned on 20.05.2023.
//

import Foundation

class InputModule {
    func getInput() -> [Int]? {
        print("Enter elements of the array separated by commas:")
        if let input = readLine() {
            let elements = input.components(separatedBy: ",")
            var myArray: [Int] = []
            for element in elements {
                if let num = Int(element.trimmingCharacters(in: .whitespaces)) {
                    myArray.append(num)
                }
            }
            return myArray.isEmpty ? [] : myArray
        } else {
            return nil
        }
    }
}

class InputModuleStub: InputModule {
    override func getInput() -> [Int] {
        return [8, 4, 6, 13, 10, 101, 14, 17, 18, 26]
    }
}
