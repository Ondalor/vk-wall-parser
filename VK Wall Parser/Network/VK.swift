//
//  VK.swift
//  VK Wall Parser
//
//  Created by Karpievich Roman on 7/29/18.
//  Copyright © 2018 by.no. All rights reserved.
//

import Foundation
import Moya

public enum VK {
    case wallPosts(Int)
}

extension VK: TargetType {
    
    private var accessToken: String {
        return "f58da265f58da265f58da265f9f5e8c574ff58df58da265aed1d14b7882517c5d6df2f8"
    }
    
    public var baseURL: URL {
        return URL(string: "https://api.vk.com")!
    }
    
    public var path: String {
        return "/method/wall.get"
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .wallPosts(let ID):
            return .requestParameters(parameters: ["v": "5.52",
                                                   "owner_id": ID,
                                                   "count": 50,
                                                   "access_token": accessToken],
                                      encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        return [:]
    }
    
}


