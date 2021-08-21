//
//  SearchPresenter.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 18/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import Foundation
import SwiftUI

class SearchPresenter {
    var viewModel: SearchViewModelProtocol

    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
    }

    func search() {
        self.viewModel.showingAlert = self.viewModel.searchText.isEmpty
        if !self.viewModel.showingAlert {
            self.viewModel.action = 1
        }
    }

    func manageKeyboard() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: .main) { (noti) in
            guard let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                return
            }
            let height = value.height
            self.viewModel.heightKeyboard = height
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: .main) { _ in
            self.viewModel.heightKeyboard = 0
        }
    }

    func hideNavigationBar() {
        self.viewModel.isNavigationBarHidden = true
    }
}
