//
//  TRPRestKitTest.swift
//  TRPRestKitTests
//
//  Created by Evren Yaşar on 25.08.2018.
//  Copyright © 2018 Evren Yaşar. All rights reserved.
//

import XCTest
@testable import TRPRestKit
class TRPRestKitTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        TRPClient.provideApiKey("c2db92dbf179338c691503f1788b3447")
    }
    
    
    func testCities()  {
        
        let expectation = XCTestExpectation(description: "TRPRestKit.cities expectation")
        
        TRPRestKit().cities { (result, error) in
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
        
        TRPRestKit().placeTypes { (result, error) in
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
        
        TRPRestKit().placeTypes { (result, error) in
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
    
    func testQuestionForIstanbul() {
        let expectation = XCTestExpectation(description: "TRPRestKit.Question expectation")
        
        TRPRestKit().question(cityId: 107) { (result, error) in
            if let error = error {
                XCTFail("Question Parser Fail: \(error.localizedDescription)")
                return
            }
            guard let result = result else {
                XCTFail("Question Resutl is nil")
                return
            }
            guard let jsonModel = result as? TRPQuestionJsonModel else {
                XCTFail("Question Json model coundn't converted to  TRPCityJsonModel")
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
        TRPRestKit().recommendation(settings: rec) { (result, error) in
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
    
    
    func testLogin() {
        let expectation = XCTestExpectation(description: "TRPRestKit.userLogin expectation")
        let mail = "necatievren@gmail.com"//"test@tripian.com"
        let password = "123456"
        TRPRestKit().userLogin(email: mail, password: password) { (result, error) in
            if let error = error {
                XCTFail("UserLogin Parser Fail: \(error.localizedDescription)")
                return
            }
            
            guard let result = result else {
                XCTFail("UserLogin Resutl is nil")
                return
            }
            
            guard let jsonModel = result as? TRPOAuthJsonModel else {
                XCTFail("UserLogin Json model coundn't converted to  TRPOAuthJsonModel")
                return
            }
            
            guard let userHash = TRPUserPersistent.fetchHash() else{
                XCTFail("UserLogin Hash coundn't save")
                return
            }
            
            XCTAssertEqual(userHash, jsonModel.data.accessToken,"User hash not equel user token")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    
    func testMyProgram() {
        let expectation = XCTestExpectation(description: "TRPRestKit.getMyProram expectation")
        
        TRPRestKit().getMyProgram { (result, error, pagination) in
            if let error = error {
                XCTFail("MyProgram Parser Fail: \(error.localizedDescription)")
                return
            }
            
            guard let result = result else {
                XCTFail("MyProgram Resutl is nil")
                return
            }
            
            guard let _ = result as? TRPMyProgramsJsonModel else {
                XCTFail("MyProgram Json model coundn't converted to  TRPMyProgramsJsonModel")
                return
            }
            
           expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testGetProgram() {
        
        let expectation = XCTestExpectation(description: "TRPRestKit.getProgram expectation")
        let nameSpace = "GetProgram"
        TRPRestKit().getProgram(withHash: "8218494776115390d31b85aefc7c2ac5") { (result, error, pagination) in
            if let error = error {
                XCTFail("\(nameSpace) Parser Fail: \(error.localizedDescription)")
                return
            }
            
            guard let result = result else {
                XCTFail("\(nameSpace) Resutl is nil")
                return
            }
            
            guard let _ = result as? TRPProgramJsonModel else {
                XCTFail("\(nameSpace) Json model coundn't converted to  TRPMyProgramsJsonModel")
                return
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testCreateProgram() {
        
        let expectation = XCTestExpectation(description: "TRPRestKit.getProgram expectation")
        let nameSpace = "CreateProgram"
        let arrival = TRPTime(year: 2019, month: 01, day: 05, hours: 08, min: 00)
        let departure = TRPTime(year: 2019, month: 01, day: 08, hours: 18, min: 00)
        let settings = TRPProgramSettings(cityId: 107, arrivalTime: arrival, departureTime: departure)
        
        TRPRestKit().createProgram(settings: settings) { (result, error) in
            if let error = error {
                XCTFail("\(nameSpace) Parser Fail: \(error.localizedDescription)")
                return
            }
            guard let result = result else {
                XCTFail("\(nameSpace) Resutl is nil")
                return
            }
            guard let _ = result as? TRPProgramJsonModel else {
                XCTFail("\(nameSpace) Json model coundn't converted to  TRPMyProgramsJsonModel")
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    
    
    
    
    
}
