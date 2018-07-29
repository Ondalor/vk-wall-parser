//
//  UIViewController.swift
//  VK Wall Parser
//
//  Created by Karpievich Roman on 7/29/18.
//  Copyright © 2018 by.no. All rights reserved.
//

import UIKit


extension UIViewController {
    
    static func storyboardInstance() -> Self? {
        return instantiateFromStoryboard()
    }
    
    private static func instantiateFromStoryboard<T>() -> T? {
        let storyboard = UIStoryboard(name: String(describing: T.self), bundle: nil)
        return storyboard.instantiateInitialViewController() as? T
    }
    
}
