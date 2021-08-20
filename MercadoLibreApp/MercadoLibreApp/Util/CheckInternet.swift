//
//  CheckInternet.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 5/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import Foundation
import Network

class CheckInternet {

    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")

    func startMonitoring(completion: @escaping (Bool) -> Void) {
        self.monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                completion(true)
            } else {
                completion(false)
            }
        }
        self.monitor.start(queue: queue)
    }

    func stopMonitoring() {
        self.monitor.cancel()
    }

}
