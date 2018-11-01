//
//  TRPTripJsonModel.swift
//  TRPRestKit
//
//  Created by Evren Yaşar on 12.09.2018.
//  Copyright © 2018 Evren Yaşar. All rights reserved.
//

import Foundation
public class TRPTripJsonModel: TRPParentJsonModel {
    
    public var data: TRPTripInfoModel?;
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try values.decode(TRPTripInfoModel.self, forKey: .data)
        try super.init(from: decoder);
    }
    
}