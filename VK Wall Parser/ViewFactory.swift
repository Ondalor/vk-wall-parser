//
//  ViewFactory.swift
//  VK Wall Parser
//
//  Created by Karpievich Roman on 7/29/18.
//  Copyright © 2018 by.no. All rights reserved.
//

import UIKit

class ViewFactory  {
    
    static func createWallParserScene() -> UIViewController {
        let presenter = WallParsePresenter()
        let controller = WallParseViewController.storyboardInstance()
        presenter.view = controller
        controller?.presenter = presenter
        
        return controller!
    }
}
