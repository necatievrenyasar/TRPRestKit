//
//  TRPOauthServices.swift
//  TRPRestKit
//
//  Created by Evren Yaşar on 24.08.2018.
//  Copyright © 2018 Evren Yaşar. All rights reserved.
//

import Foundation

internal class TRPLogin: TRPRestServices<TRPGenericParser<TRPLoginTokenInfoModel>> {
    
    //Airmiles
    private var email: String?
    private var password: String?
    //Test server
    private var loginParameters: [String: String]
    
    init?(parameters: [String: String]) {
        if parameters.count == 0 {
            return nil
        }
        for param in parameters {
            if param.key.isEmpty || param.value.isEmpty {
                return nil
            }
        }
        loginParameters  = parameters
    }
    
    override public func requestMode() -> TRPRequestMode {
        return TRPRequestMode.post
    }
    
    public override func path() -> String {
        return TRPConfig.ApiCall.login.link
    }
    
    public override func bodyParameters() -> [String: Any]? {
        return loginParameters
    }

}
