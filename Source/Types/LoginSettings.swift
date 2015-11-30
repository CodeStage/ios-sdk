//
//  LoginSettings.swift
//  Figo
//
//  Created by Christian König on 28.11.15.
//  Copyright © 2015 CodeStage. All rights reserved.
//


public struct LoginSettings {
    
    /// Human readable name of the bank
    let bank_name: String
    
    /// Flag showing whether figo supports the bank
    let supported: Bool
    
    /// URL to an logo of the bank, e.g. as a badge icon
    let icon: String
    
    /// Dictionary mapping from resolution to URL for additional resolutions of the banks icon. Currently supports 48x48 and 60x60.
    let additional_icons: [String: String]

    /// List of credentials needed to connect to the bank.
    let credentials: [LoginCredentials]
    
    /// Kind of authentication used by the bank, commonly PIN
    let auth_type: String
    
    /// Any additional advice useful to locate the required credentials
    let advice: String?
}

extension LoginSettings: ResponseObjectSerializable {
    
    public init(representation: AnyObject) throws {
        let mapper = try Decoder(representation, typeName: "\(self.dynamicType)")
        
        bank_name           = try mapper.valueForKeyName("bank_name")
        supported           = try mapper.valueForKeyName("supported")
        icon                = try mapper.valueForKeyName("icon")
        additional_icons    = try mapper.valueForKeyName("additional_icons")
        credentials         = try LoginCredentials.collection(mapper.valueForKeyName("credentials"))
        auth_type           = try mapper.valueForKeyName("auth_type")
        advice              = try mapper.optionalForKeyName("advice")
    }
}

