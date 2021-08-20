//
//  Localizator.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 18/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import Foundation

public protocol XIBLocalizable {
    var localizableKey: String? { get set }
}

private class Localizator {

    static let sharedInstance = Localizator()

    func localize(_ string: String) -> String {
        return NSLocalizedString(string, bundle: Bundle(for: type(of: self)), comment: "")

    }
}

extension String {
    public var localized: String {
        return Localizator.sharedInstance.localize(self)
    }

    func localizeWithFormat(arguments: CVarArg...) -> String {
       return String(format: self.localized, arguments: arguments)
    }
}
