//
// Lab 4
//

import Foundation

class SEM: RCOND {
    private let semaphore = DispatchSemaphore(value: 1)
    
    override func withdraw(amount: Int, threadNum: Int) {
        semaphore.wait()
        
        super.withdraw(amount: amount, threadNum: threadNum)
        
        semaphore.signal()
    }
}
