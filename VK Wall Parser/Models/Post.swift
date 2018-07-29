//
//  Post.swift
//  VK Wall Parser
//
//  Created by Karpievich Roman on 7/29/18.
//  Copyright © 2018 by.no. All rights reserved.
//

import Foundation

struct Response: Codable {
    var responseBody: ResponseBody
    
    struct ResponseBody: Codable {
        var count: Int
        var items: [Post]
    }
    
    enum CodingKeys: String, CodingKey {
        case responseBody = "response"
    }
}

class Post: Codable {
    
    var id = 0
    var text = ""
}
