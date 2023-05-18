//
//  SIGNALS.swift
//  parallel-programming
//
//  Created by Eugene Ned on 18.05.2023.
//

import Foundation

class SIGNALS {

    func start() {
        signal(SIGINT) { signal in
            print("received")
            exit(0)
        }
        
        while true {
            print("waiting")
            sleep(1)
        }
    }
}

