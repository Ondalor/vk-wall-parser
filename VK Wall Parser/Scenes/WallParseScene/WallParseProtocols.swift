//
//  WallParseScene.swift
//  VK Wall Parser
//
//  Created by Karpievich Roman on 7/29/18.
//  Copyright © 2018 by.no. All rights reserved.
//

import Foundation

protocol WallParsePresenterProtocol: class {
    func search(for id: String, type: SearchType)
}
protocol WallParseViewProtocol: class {
    func showPosts(postsData: [PostData])
    func showError(withMessage errorMessage: String)
}


