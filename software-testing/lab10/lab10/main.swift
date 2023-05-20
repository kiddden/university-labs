//
//  main.swift
//  lab10
//
//  Created by Eugene Ned on 20.05.2023.
//

import Foundation

class MainModule {
    
    let inputModule: InputModule
    let copyModule: CopyModule
    let sortModule: SortModule
    let outputModule: OutputModule
    
    init() {
        self.inputModule = InputModuleStub()
        self.copyModule = CopyModule()
        self.sortModule = SortModuleStub()
        self.outputModule = OutputModule()
    }
    
    func run() {
        let arrayA = inputModule.getInput()
        
        if let arrayA = arrayA, !arrayA.isEmpty {
            let arrayB = copyModule.getEvenNumbers(inputArray: arrayA)
            let sortedArray = sortModule.sortArray(inputArray: arrayB)
            
            outputModule.printResults(arrayB: arrayB, sortedArray: sortedArray)
        } else {
            print("\nInvalid input")
        }
    }
}

let mainModule = MainModule()
mainModule.run()
