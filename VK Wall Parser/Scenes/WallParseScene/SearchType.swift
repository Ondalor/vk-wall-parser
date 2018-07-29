//
//  SearchType.swift
//  VK Wall Parser
//
//  Created by Karpievich Roman on 7/29/18.
//  Copyright © 2018 by.no. All rights reserved.
//

import Foundation

enum SearchType {
    
    case people
    case groups
    
    static var allCases: [SearchType] = [.people, .groups]
    
    var title: String {
        switch self {
        case .people:
            return "People"
        case .groups:
            return "Groups"
        }
    }
    
    static func type(forNumber number: Int) -> SearchType? {
        for (index, value) in SearchType.allCases.enumerated() {
            if index == number {
                return value
            }
        }
        
        return nil
    }
    
}
