//
// Lab 2
//
import Foundation

class RFIX: RCOND {
    private let syncQueue = DispatchQueue(label: "SyncQueue")
    
    override func withdraw(amount: Int, threadNum: Int) {
        // Using the serial queue to synchronize access to `balance`
        syncQueue.sync {
            if balance >= amount {
                print("[Thread-\(threadNum)] Withdrawing \(amount)USD from balance")
                balance -= amount
            } else {
                print("Insufficient amount on balance")
            }
            print("Balance: \(balance)")
        }
    }
}
