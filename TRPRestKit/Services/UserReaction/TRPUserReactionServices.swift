//
//  TRPUserReactionServices.swift
//  TRPRestKit
//
//  Created by Evren Yaşar on 1.05.2020.
//  Copyright © 2020 Evren Yaşar. All rights reserved.
//

import Foundation
internal class TRPUserReactionServices: TRPRestServices<TRPGenericParser<TRPReactionModel>> {
    
    private let stepId: Int
    private let poiId: Int
    private var reaction: UserReactionType?
    private var comment: String?
    
    internal init(stepId: Int, poiId: Int, reaction: UserReactionType?, comment: String?) {
        self.stepId = stepId
        self.poiId = poiId
        self.reaction = reaction
        self.comment = comment
    }
    
    public override func path() -> String {
        return TRPConfig.ApiCall.userReaction.link
    }
    
    override func userOAuth() -> Bool {
        return true
    }
    
    override func requestMode() -> TRPRequestMode {
        .post
    }
    
    override func bodyParameters() -> [String: Any]? {
        
        var params = [String: Any]()
        params["poi_id"] = poiId
        params["step_id"] = stepId
        
        if let reaction = reaction {
            params["reaction"] = reaction.rawValue
        }
        if let comment = comment {
            params["comment"] = comment
        }
        print("PARAMETRE \(params)")
        return params
    }
}