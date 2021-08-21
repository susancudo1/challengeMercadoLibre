//
//  MercadoLibreAppUITests.swift
//  MercadoLibreAppUITests
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import XCTest

class MercadoLibreAppUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testSearchView() {

        // SearchView
        let searchButton = app.scrollViews.otherElements.buttons["Buscar"]
        XCTAssertEqual(searchButton.label, "Buscar")

        let textFielsSearch = app.scrollViews.otherElements.textFields["Buscar en mercadolibre"]
        XCTAssertEqual(textFielsSearch.label, "")

        let logoImage =  app.scrollViews.otherElements.images["logoMercadoLibre"]
        XCTAssertNotNil(logoImage)

        textFielsSearch.tap()
        // swiftlint:disable line_length
        let lKey = app/*@START_MENU_TOKEN@*/.keys["L"]/*[[".keyboards.keys[\"L\"]",".keys[\"L\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lKey.tap()

        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()

        let gKey = app/*@START_MENU_TOKEN@*/.keys["g"]/*[[".keyboards.keys[\"g\"]",".keys[\"g\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        gKey.tap()

        let oKey = app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()

        searchButton.tap()

        // ListView
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let buscarEnMercadolibreTextField = elementsQuery.textFields["Buscar en mercadolibre"]

        let legoStaticText = app.staticTexts["Lego"]
        legoStaticText.tap()
        legoStaticText.tap()
        legoStaticText.tap()
        scrollViewsQuery.otherElements.containing(.staticText,
                                                  identifier: "$3,999").staticTexts["Lego® Classic - Bricks & Ideas (11001)"].tap()

        let atrSButton = app.buttons["Atrás"]
        atrSButton.tap()
        atrSButton.tap()
        buscarEnMercadolibreTextField.tap()

    }
}
