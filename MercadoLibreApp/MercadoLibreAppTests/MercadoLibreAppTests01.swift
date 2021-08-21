//
//  MercadoLibreAppTests.swift
//  MercadoLibreAppTests
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import XCTest
@testable import MercadoLibreApp

class MercadoLibreAppTests01: XCTestCase {

    let mockProducts = MockProductsTest()

    func test01SuccesSearch() {

        let session = URLSessionMock()
        let worker = MercadoLibreWorker(session: session)

        let data = Data(self.mockProducts.getMockProductTest().utf8)
        session.nextData = data
        let url = URL(string: worker.mercadoLibreUrlWorkerObj.getProductsSearchUrl())
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: [Product]?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getSearch(searchText: "Motorola G6") { (success, products) in
            successResponse = success
            response = products
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertTrue(successResponse!)
        XCTAssertEqual(response![0].ident, "MLA871811974")
    }

    func test02FailSearch() {
        let session = URLSessionMock()
        let worker = MercadoLibreWorker(session: session)

        let url = URL(string: worker.mercadoLibreUrlWorkerObj.getProductsSearchUrl())
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 400, httpVersion: "2.0", headerFields: nil)
        let data = Data(self.mockProducts.getMockProductTest().utf8)
        session.nextData = data

        // Perform the request and verify the result
        var successResponse: Bool?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getSearch(searchText: "Motorola G6") { (success, _) in
            successResponse = success
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10)

        XCTAssertFalse(successResponse!)
    }

    func test03SuccessDownloadImage() {
        let session = URLSessionMock()
        let worker = DownloadImageWorker(session: session)

        let image = #imageLiteral(resourceName: "logoMercadoLibre")
        let data = image.pngData()
        session.nextData = data
        let url = URL(string: worker.mercadoLibreUrlWorkerObj.getProductsSearchUrl())
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: Data?
        let exp = self.expectation(description: "Waiting for blocking")
        worker.getImage(Product(ident: UUID().uuidString,
                                title: "Prueba",
                                price: 29.0,
                                thumbnail: "http://mla-s1-p.mlstatic.com/909111-MLA31239994076_062019-I.jpg",
                                imageData: nil,
                                condition: "nuevo",
                                seller: Seller(sellerReputation:
                                                SellerReputation(transactions:
                                                                    Transactions(ratings:
                                                                                    Ratings(positive: 0.99),
                                                                                 completed: 35))),
                                currencyId: "COP")) { (success, imageData) in
            successResponse = success
            response = imageData
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10)

        XCTAssertTrue(successResponse!)
        XCTAssertNotNil(response)
    }

    func test04FailDownloadImage() {
        let session = URLSessionMock()
        let worker = DownloadImageWorker(session: session)

        let image = #imageLiteral(resourceName: "logoMercadoLibre")
        let data = image.pngData()
        session.nextData = data
        let url = URL(string: worker.mercadoLibreUrlWorkerObj.getProductsSearchUrl())
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 400, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: Data?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getImage(Product(ident: UUID().uuidString,
                                title: "Prueba",
                                price: 29.0,
                                thumbnail: "http://mla-s1LA31239994076_06",
                                imageData: nil,
                                condition: "nuevo",
                                seller: Seller(sellerReputation:
                                                SellerReputation(transactions:
                                                                    Transactions(ratings:
                                                                                    Ratings(positive: 0.99),
                                                                                 completed: 35))),
                                currencyId: "COP")) { (success, imageData) in
            successResponse = success
            response = imageData
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10)

        XCTAssertFalse(successResponse!)
        XCTAssertNil(response)
    }

    func test05SearchPresenterSearch() {
        let viewModel = SearchViewModel()
        let searchPresenter = SearchPresenter(viewModel: viewModel)
        searchPresenter.search()
        XCTAssertNil(viewModel.action)

        viewModel.searchText = "Buscar"
        searchPresenter.search()
        XCTAssertEqual(viewModel.action, 1)
    }

    func test06ListPresenterSearch() {
        let session = URLSessionMock()
        let mercadoLibreWorker = MercadoLibreWorker(session: session)
        let downloadImageWorker = DownloadImageWorker(session: session)
        let viewModel = SearchViewModel()
        let productSearchUseCase = ProductSearchUseCase(mercadoLibreWorker: mercadoLibreWorker,
                                                        downloadImageWorker: downloadImageWorker)
        let listPresenter = ListPresenter(viewModel: viewModel,
                                          productSearchUseCase: productSearchUseCase)
        listPresenter.search(searchText: "Cama")
    }

}
