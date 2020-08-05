//
//  DownloadImageWorker.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import Foundation

class DownloadImageWorker {
    
    let mercadoLibreUrlWorkerObj = MercadoLibreURLWorker()
    let setupRequestWorkerObj = SetupRequestWorker()
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func getImage(_ product: Product, completion: @escaping (Bool, Data?) -> Void) {
        let request = setupRequestWorkerObj.setupGetRequest(mainUrl: product.thumbnail)
        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            self.responseCompletionImage(response, data, error, completion: completion)
        }).resume()
    }
    
    fileprivate func responseCompletionImage(_ response: URLResponse?, _ data: Data?, _ error: Error?, completion: @escaping (Bool, Data?) -> Void) {
        DispatchQueue.main.async {
            let httpStatus = response as? HTTPURLResponse
            if httpStatus?.statusCode == 200 {
                completion(true, data)
            } else {
                NSLog("\(httpStatus?.statusCode ?? 400)")
                NSLog("\(httpStatus?.description ?? "Error getImage Function")")
                completion(false, nil)
            }
        }
    }
}

