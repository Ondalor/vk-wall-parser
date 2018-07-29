//
//  Error.swift
//  VK Wall Parser
//
//  Created by Karpievich Roman on 7/29/18.
//  Copyright © 2018 by.no. All rights reserved.
//

import Foundation

enum VKErrors: Error {
    case accessDenied
    case userDeleted
    
    var errorMessage: String {
        switch self {
        case .accessDenied:
            return "Access Denied"
        case .userDeleted:
            return "User was deleted"
        }
        
    }
    
    static func error(fromCode code: Int) -> VKErrors? {
        if code == 15 {
            return .accessDenied
        } else if code == 18 {
            return .userDeleted
        }
        
        return nil
    }
}

struct VKErrorJSON: Codable {
    var errorBody: Error
    
    struct Error: Codable {
        var errorCode: Int
        var errorMessage: String
        
        enum CodingKeys: String, CodingKey {
            case errorCode = "error_code"
            case errorMessage = "error_msg"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case errorBody = "error"
    }
}
