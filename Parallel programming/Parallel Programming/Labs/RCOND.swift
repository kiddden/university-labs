//
//  RCOND.swift
//  Parallel programming
//
//  Created by Eugene Ned on 12.04.2023.
//

import Foundation

class RCOND {
    private var balance = 100

    private let queue1 = DispatchQueue(label: "Queue1", attributes: .concurrent)
    private let queue2 = DispatchQueue(label: "Queue2", attributes: .concurrent)
    
    func initiateRaceCondition() {
        queue1.async {
            self.withdraw(amount: 50, threadNum: 1)
        }

        queue2.async {
            self.withdraw(amount: 70, threadNum: 2)
        }
        runLoop()
    }

    private func withdraw(amount: Int, threadNum: Int) {
        if balance >= amount {
            print("[Thread-\(threadNum)] Withdrawing \(amount)USD from balance")
            balance -= amount
        } else {
            print("Insufficient amount on balance")
        }
        print("Balance: \(balance)")
    }

    // Helper function that keeps our threads alive
    private func runLoop() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in }
        let runLoop = RunLoop.current
        runLoop.add(timer, forMode: .common)
        runLoop.run()
    }
}
