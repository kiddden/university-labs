//
// Lab 3
//
import Foundation

class EVENT {
    private let ipcEventName = Notification.Name("com.example.ipcEvent")

    private let listener: EventListener
    private let sender: EventSender
    
    init() {
        self.listener = EventListener(eventName: ipcEventName)
        self.sender = EventSender()
    }
    
    func sendEvent() {
        sender.sendIPCEvent(ipcEventName)
        
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))
    }
}

class EventListener {
    
    init(eventName: Notification.Name) {
        NotificationCenter.default.addObserver(self, selector: #selector(handleIPCEvent(notification:)), name: eventName, object: nil)
    }

    @objc func handleIPCEvent(notification: Notification) {
        if let data = notification.userInfo as? [String: String] {
            for (key, value) in data {
                print("\(key): \(value)")
            }
        }
    }
}

class EventSender {
    func sendIPCEvent(_ eventName: Notification.Name) {
        let data: [String: String] = ["message": "Hello, IPC Event!"]
        NotificationCenter.default.post(name: eventName, object: nil, userInfo: data)
    }
}
