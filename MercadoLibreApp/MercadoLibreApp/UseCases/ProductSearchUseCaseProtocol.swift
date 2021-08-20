//
//  ProductSearchUseCaseProtocol.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 19/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import Foundation

protocol ProductSearchUseCaseProtocol {
    func search(searchText: String, completion: @escaping ([Product]?) -> Void)
}
