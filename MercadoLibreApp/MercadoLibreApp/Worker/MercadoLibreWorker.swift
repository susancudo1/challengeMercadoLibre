//
//  MercadoLibreWorker.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import Foundation

class MercadoLibreWorker: MercadoLibreWorkerProtocol {

    let mercadoLibreUrlWorkerObj = MercadoLibreURLWorker()
    let setupRequestWorkerObj = SetupRequestWorker()

    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func getSearch(searchText: String, completion: @escaping (Bool, [Product]?) -> Void) {
        var getGetProductsSearchUrl = self.mercadoLibreUrlWorkerObj.getProductsSearchUrl()
        getGetProductsSearchUrl += searchText
        getGetProductsSearchUrl = getGetProductsSearchUrl.addingPercentEncoding(withAllowedCharacters:
                                                                                    .urlQueryAllowed)!
        let request = setupRequestWorkerObj.setupGetRequest(mainUrl: getGetProductsSearchUrl)

        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            self.responseCompletion(response, data, error, completion: completion)
        }).resume()
    }

    fileprivate func responseCompletion(_ response: URLResponse?,
                                        _ data: Data?,
                                        _ error: Error?,
                                        completion: @escaping (Bool, [Product]?) -> Void) {
        DispatchQueue.main.async {
            do {
                let httpStatus = response as? HTTPURLResponse
                if httpStatus?.statusCode == 200 {
                    let decoder = JSONDecoder()
                    let queryResultModel = try decoder.decode(QueryResult.self, from: data!)
                    completion(true, queryResultModel.results)
                } else {
                    NSLog("\(httpStatus?.statusCode ?? 400)")
                    NSLog("\(httpStatus?.description ?? "Error getSearch function")")
                    completion(false, nil)
                }
            } catch {
                NSLog(error.localizedDescription)
                completion(false, nil)
            }
        }
    }
}
