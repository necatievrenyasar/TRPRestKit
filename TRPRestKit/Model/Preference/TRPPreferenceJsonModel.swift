//
//  TRPPreferenceJsonModel.swift
//  TRPRestKit
//
//  Created by Evren Yaşar on 29.08.2018.
//  Copyright © 2018 Evren Yaşar. All rights reserved.
//

import Foundation
public class TRPPreferenceJsonModel: TRPParentJsonModel{
    
    public var data: [TRPUserPreferencesInfoModel]?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let datas = try? values.decodeIfPresent([TRPUserPreferencesInfoModel].self, forKey: .data) {
            self.data = datas
        }else if let infoModel = try? values.decodeIfPresent(TRPUserPreferencesInfoModel.self, forKey: .data) {
            self.data = [infoModel] as? [TRPUserPreferencesInfoModel]
        }
        
        try super.init(from: decoder);
    }
}
