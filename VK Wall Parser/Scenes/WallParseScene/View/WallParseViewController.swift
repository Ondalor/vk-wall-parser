//
//  WallParseViewController.swift
//  VK Wall Parser
//
//  Created by Karpievich Roman on 7/29/18.
//  Copyright © 2018 by.no. All rights reserved.
//

import UIKit

struct PostData {
    let text: String
}

class WallParseViewController: UIViewController, WallParseViewProtocol, UITableViewDataSource, UISearchBarDelegate {
    
    var presenter: WallParsePresenterProtocol?
    var postsData: [PostData] = []
    
    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = SearchType.allCases.map({ $0.title })
    }
    
    // MARK: - WallParseViewProtocol
    
    func showPosts(postsData: [PostData]) {
        self.postsData = postsData
        
        postsTableView.reloadData()
        
    }
    
    func showError(withMessage errorMessage: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: errorMessage,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        
        self.present(alertController,
                     animated: true,
                     completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostDataCell", for: indexPath)
        cell.textLabel?.text = postsData[indexPath.row].text
        cell.textLabel?.numberOfLines = 4
        
        return cell
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let type = SearchType.type(forNumber: searchBar.selectedScopeButtonIndex),
            let searchText = searchBar.text else {
                return
        }
        
        presenter?.search(for: searchText, type: type)
    }
}
