//
// Lab 5
//

import Foundation

class MUTEX: RCOND {
    private let lock = NSLock()

    override func withdraw(amount: Int, threadNum: Int) {
        lock.lock()
        defer { lock.unlock() }

        super.withdraw(amount: amount, threadNum: threadNum)
    }
}
