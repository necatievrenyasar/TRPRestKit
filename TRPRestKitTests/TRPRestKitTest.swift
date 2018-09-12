//
//  TRPRestKitTest.swift
//  TRPRestKitTests
//
//  Created by Evren Yaşar on 25.08.2018.
//  Copyright © 2018 Evren Yaşar. All rights reserved.
//

import XCTest
@testable import TRPRestKit
import TRPFoundationKit
class TRPRestKitTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        TRPClient.provideApiKey("c2db92dbf179338c691503f1788b3447")
    }
    
    func testCitiesWithLocation(){
        let expectation = XCTestExpectation(description: "TRPRestKit.cities with location")
        let cityLocation = TRPLocation(lat: 41, lon: 29)
       
        TRPRestKit().city(with: cityLocation) { (result, error) in
            if let error = error {
                XCTFail("City Parser Fail: \(error.localizedDescription)")
                return
            }
            guard let result = result else {
                XCTFail("City Resutl is nil")
                return
            }
            
            guard let jsonModel = result as? TRPCityJsonModel else {
                XCTFail("City Json model coundn't converted to  TRPCityJsonModel")
                return
            }
            
            guard let citiesInfoModel = jsonModel.data else {
                XCTFail("City Json model have got no info models")
                return
            }
            
            XCTAssert(citiesInfoModel.count > 0, "Haven't got cities model")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    
    func testPlacesTypes() {
        let expectation = XCTestExpectation(description: "TRPRestKit.Types expectation")
        
        TRPRestKit().placeTypes { (result, error, _) in
            if let error = error {
                XCTFail("Types Parser Fail: \(error.localizedDescription)")
                return
            }
            guard let result = result else {
                XCTFail("Types Resutl is nil")
                return
            }
            
            guard let jsonModel = result as? TRPPlaceTypeJsonModel else {
                XCTFail("Types Json model coundn't converted to  TRPPlaceTypeJsonModel")
                return
            }
            
            guard let citiesInfoModel = jsonModel.data else {
                XCTFail("Types Json model have got no info models")
                return
            }
            
            XCTAssert(citiesInfoModel.count > 0, "Haven't got Types model")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testTypes() {
        let expectation = XCTestExpectation(description: "TRPRestKit.Types expectation")
        
        TRPRestKit().placeTypes { (result, error, _) in
            if let error = error {
                XCTFail("Types Parser Fail: \(error.localizedDescription)")
                return
            }
            guard let result = result else {
                XCTFail("Types Resutl is nil")
                return
            }
            
            guard let jsonModel = result as? TRPPlaceTypeJsonModel else {
                XCTFail("Types Json model coundn't converted to  TRPPlaceTypeJsonModel")
                return
            }
            
            guard let citiesInfoModel = jsonModel.data else {
                XCTFail("Types Json model have got no info models")
                return
            }
            
            XCTAssert(citiesInfoModel.count > 0, "Haven't got Types model")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testOnePlace() {
        let expectation = XCTestExpectation(description: "TRPRestKit.Places expectation")
        TRPRestKit().place(withId: 2365) { (result, error) in
            if let error = error {
                XCTFail("Places Parser Fail: \(error.localizedDescription)")
                return
            }
            guard let result = result else {
                XCTFail("Places Resutl is nil")
                return
            }
            guard let jsonModel = result as? TRPPlaceJsonModel else {
                XCTFail("Places Json model coundn't converted to  TRPPlaceJsonModel")
                return
            }
            guard let infoModel = jsonModel.data else {
                XCTFail("Places Json model have got no info models")
                return
            }
            
            XCTAssert(infoModel.count > 0, "Haven't got Places model")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testRecommendationForIstanbul() {
        
        let expectation = XCTestExpectation(description: "TRPRestKit.Recommendation expectation")
        
        let rec = TRPRecommendationSettings(cityId: 107)
        TRPRestKit().recommendation(settings: rec) { (result, error,_) in
            if let error = error {
                XCTFail("Recommendation Parser Fail: \(error.localizedDescription)")
                return
            }
            guard let result = result else {
                XCTFail("Recommendation Resutl is nil")
                return
            }
            guard let jsonModel = result as? TRPRecommendationJsonModel else {
                XCTFail("Recommendation Json model coundn't converted to  TRPCityJsonModel")
                return
            }
            guard let infoModel = jsonModel.data else {
                XCTFail("Recommendation Json model have got no info models")
                return
            }
            
            XCTAssert(infoModel.count > 0, "Haven't got Recommendation model")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    
}
