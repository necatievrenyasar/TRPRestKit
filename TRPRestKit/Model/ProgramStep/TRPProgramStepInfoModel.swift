//
//  TRPProgramStepInfoModel.swift
//  TRPRestKit
//
//  Created by Evren Yaşar on 29.08.2018.
//  Copyright © 2018 Evren Yaşar. All rights reserved.
//

import Foundation
public struct TRPProgramStepInfoModel: Decodable {
    
    var id: Int;
    var hash: String;
    var dayId: Int;
    var placeId: Int
    var order: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case hash
        case dayId = "day_id"
        case placeId = "place_id"
        case order
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self);
        id = try values.decode(Int.self, forKey: .id)
        hash = try values.decode(String.self, forKey: .hash)
        dayId = try values.decode(Int.self, forKey: .dayId)
        placeId = try values.decode(Int.self, forKey: .placeId)
        order = try values.decode(Int.self, forKey: .order)
    }
    
}
