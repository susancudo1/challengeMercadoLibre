//
//  MercadoLibreURLWorker.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import Foundation

class MercadoLibreURLWorker {

    // MARK: Variable name for the main API URL DRUO
    private let apiUrlMercadoLibre = "API_MAIN_URL"

    // MARK: Subdomain for user endpoint
    private let searchSubdomain = "search?q="

    // MARK: Gets the full endpoint for Block user function
    func getProductsSearchUrl() -> String {
        return getVariableFromPlist(variableName: apiUrlMercadoLibre) + searchSubdomain
    }

    // MARK: Function used to get the main backend URL from xcconfig file
    private func getVariableFromPlist(variableName: String) -> String {
        return ((Bundle.main.infoDictionary?[variableName] as? String)?.replacingOccurrences(of: "\\", with: ""))!
    }

}
