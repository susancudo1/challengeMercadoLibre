//
//  URLSessionMock.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import Foundation

class URLSessionMock: URLSessionProtocol {
    
    var nextDataTask = URLSessionDataTaskMock()
    var nextData: Data?
    var nextResponse: URLResponse?
    var nextError: Error?
    
    private (set) var lastURL: URL?
    
    func dataTask(with request: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = request
        completionHandler(nextData, nextResponse, nextError)
        return nextDataTask
    }
}
