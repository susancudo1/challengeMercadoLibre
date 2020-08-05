//
//  StringExtensions.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 5/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
