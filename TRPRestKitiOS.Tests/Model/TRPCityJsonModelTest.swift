//
//  TRPCityJsonModelTest.swift
//  TRPRestKitiOS.Tests
//
//  Created by Evren Yaşar on 11.10.2019.
//  Copyright © 2019 Evren Yaşar. All rights reserved.
//

import XCTest
@testable import TRPRestKit

class TRPCityJsonModelTest: XCTestCase {
    
    var jsonDecoder: JSONDecoder?
    
    override func setUp() {
        super.setUp()
        jsonDecoder = JSONDecoder()
    }
    /*
     {
         "id": 102,
         "name": "Cape Town",
         "image": {
             "url": "https://poi-pics.s3-eu-west-1.amazonaws.com/City/102/featured.jpg",
             "image_owner": null
         },
         "boundary": [-34.08899, -33.74502, 18.2574, 18.59525],
         "coordinate": {
             "lat": -33.9248685,
             "lng": 18.424055299999964
         },
         "country": {
             "name": "South Africa",
             "code": "za",
             "continent": {
                 "name": "Africa"
             }
         }
     }*/
    func testBaseData() {
        let rawJson = """
        {
            "status": 200,
            "success": true,
            "data": [
                    {
                        "id": 107,
                        "name": "Istanbul",
                        "image": {
                            "url": "https://poi-pics.s3-eu-west-1.amazonaws.com/City/107/featured.jpg",
                            "image_owner": null
                        },
                        "boundary": [40.82158, 41.28015, 28.52227, 29.36824],
                        "coordinate": null,
                        "country": {
                            "name": "Turkey",
                            "code": "tr",
                            "continent": {
                                "name": "Europe"
                            }
                        }
                    }
            ]
        }
"""

        do {
            let result = try jsonDecoder!.decode(TRPCityJsonModel.self, from: rawJson.data(using: String.Encoding.utf8)!)
            
            if result.data == nil {
                XCTFail("TRPCity models is nil")
            }
            
            guard let berlin = result.data?.first else {
                XCTFail("TRPCity first data is nil")
                return
            }
            
            XCTAssertEqual(berlin.id, 107)
            XCTAssertEqual(berlin.name, "Istanbul")
            XCTAssertNil(berlin.coordinate)
            XCTAssertEqual(berlin.coordinate.lat, 52.5200066)
            XCTAssertEqual(berlin.coordinate.lon, 13.404953999999975)
            
        } catch let tryError {
            XCTFail(tryError.localizedDescription)
        }
    }
    
    func testFullCityData() {
        let rawJson = getCityData()
        do {
            let result = try jsonDecoder!.decode(TRPCityJsonModel.self, from: rawJson.data(using: String.Encoding.utf8)!)
            XCTAssertNotNil(result.data)
            
            let losAngeles = result.data?.first
            XCTAssertNotNil(losAngeles)
            
            XCTAssertEqual(losAngeles!.id, 10)
            XCTAssertEqual(losAngeles!.name, "Los Angeles")
            XCTAssertNotNil(losAngeles!.image)
            XCTAssertEqual(losAngeles!.image.url, "https://poi-pics.s3-eu-west-1.amazonaws.com/City/10/featured.jpg")
            XCTAssertEqual(losAngeles!.boundary.count, 4)
            XCTAssertEqual(losAngeles!.coordinate.lat, 34.0522342)
            XCTAssertEqual(losAngeles!.coordinate.lon, -118.2436849)
            
            XCTAssertNotNil(losAngeles!.country.code)
            XCTAssertNotNil(losAngeles!.country.name)
            XCTAssertEqual(losAngeles!.country.code, "us")
            XCTAssertEqual(losAngeles!.country.name, "USA")
            
        } catch let tryError {
            XCTFail(tryError.localizedDescription)
        }
    }
 
    private func getCityData() -> String {
        let rawJson = """
                {
                    "status": 200,
                    "success": true,
                    "data": [
                           {
                               "id": 10,
                               "name": "Los Angeles",
                               "featured": "https://poi-pics.s3-eu-west-1.amazonaws.com/City/10/featured.jpg",
                               "boundary": [33.70362, 34.47327, -118.66819, -117.9493],
                               "coordinate": {
                                   "lat": 34.0522342,
                                   "lng": -118.2436849
                               },
                               "country": {
                                   "code": "us",
                                   "name": "USA",
                                   "continent": {
                                       "name": "North America"
                                   }
                               }
                           }
                    ]
                }
        """
        return rawJson
    }
    
}
