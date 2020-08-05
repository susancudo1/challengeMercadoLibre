//
//  URLSessionDataTaskMock.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import Foundation

class URLSessionDataTaskMock: URLSessionDataTaskProtocol {
   
    private (set) var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
}
