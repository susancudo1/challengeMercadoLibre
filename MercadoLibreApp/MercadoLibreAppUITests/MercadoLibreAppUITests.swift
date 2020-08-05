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
        
        //SearchView
        let searchButton = app.scrollViews.otherElements.buttons["Buscar"]
        XCTAssertEqual(searchButton.label, "Buscar")
        
        let textFielsSearch = app.scrollViews.otherElements.textFields["Buscar en mercadolibre"]
        XCTAssertEqual(textFielsSearch.label, "")
        
        let logoImage =  app.scrollViews.otherElements.images["logoMercadoLibre"]
        XCTAssertNotNil(logoImage)
        
        textFielsSearch.tap()
        
        let lKey = app/*@START_MENU_TOKEN@*/.keys["L"]/*[[".keyboards.keys[\"L\"]",".keys[\"L\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lKey.tap()
        
        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        
        let gKey = app/*@START_MENU_TOKEN@*/.keys["g"]/*[[".keyboards.keys[\"g\"]",".keys[\"g\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        gKey.tap()
        
        let oKey = app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()
        
        searchButton.tap()
        
        
        //ListView
        let navigationBarTitle = app.navigationBars["Lego"].staticTexts["Lego"]
        XCTAssertEqual(navigationBarTitle.label, "Lego" )
        
        let cell = app.tables.cells.otherElements.containing(.staticText, identifier:"Lego® Classic - Ladrillos Creativos Lego® (10692)").children(matching: .image).element
        XCTAssertNotNil(cell)
        cell.tap()
        
        //DetailView
        let headImage = app.scrollViews.otherElements.containing(.staticText, identifier:"Lego® Classic - Ladrillos Creativos Lego® (10692)").children(matching: .image).element
        XCTAssertNotNil(headImage)
        
        let title = app.scrollViews.otherElements.staticTexts["Lego® Classic - Ladrillos Creativos Lego® (10692)"]
        XCTAssertEqual(title.label, "Lego® Classic - Ladrillos Creativos Lego® (10692)")
        
        let price = app.scrollViews.otherElements.staticTexts["$5,499 ARS"]
        XCTAssertEqual(price.label, "$5,499 ARS")
        
        let buttonChevron = app.buttons["chevron.down.circle"]
        XCTAssertNotNil(buttonChevron)
    }
}
