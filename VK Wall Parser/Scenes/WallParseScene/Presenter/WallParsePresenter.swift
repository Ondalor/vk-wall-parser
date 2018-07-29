//
//  WallParsePresenter.swift
//  VK Wall Parser
//
//  Created by Karpievich Roman on 7/29/18.
//  Copyright © 2018 by.no. All rights reserved.
//

import Foundation
import Moya

class WallParsePresenter: WallParsePresenterProtocol {
    
    weak var view: WallParseViewProtocol?
    var posts: [Post] = []
    
    // MARK: - WallParsePresenterProtocol
    
    func search(for id: String, type: SearchType) {
        guard var id = Int(id) else {
            return
        }
        
        if type == .groups {
            id.negate()
        }
        
        let provider = MoyaProvider<VK>()
        provider.request(.wallPosts(id)) { (result) in
            switch result {
            case .success(let response):
                if let posts = self.parsePosts(fromData: response.data) {
                    let postsData = posts.map({ (post) in
                        
                        return PostData(text: post.text)
                    })
                    self.posts = posts
                    self.view?.showPosts(postsData: postsData)
                    
                    return
                }
                
                if let error = self.parseError(fromData: response.data) {
                    self.posts.removeAll()
                    self.view?.showPosts(postsData: [])
                    self.view?.showError(withMessage: error.errorMessage)
                    
                    return
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Private methods
    
    private func parsePosts(fromData data: Data) -> [Post]? {
        guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
            return nil
        }
        
        return response.responseBody.items
    }
    
    private func parseError(fromData data: Data) -> VKErrors? {
        guard let errorResponse = try? JSONDecoder().decode(VKErrorJSON.self, from: data),
            let error = VKErrors.error(fromCode: errorResponse.errorBody.errorCode) else {
            return nil
        }
        
        return error
    }
}
