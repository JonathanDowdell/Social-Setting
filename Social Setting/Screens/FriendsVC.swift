//
//  FriendsVC.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 2/3/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class FriendsVC: UITableViewController {
    
    fileprivate func configureNav() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a username"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.searchController?.hidesBottomBarWhenPushed = true
        tableView.backgroundColor = .tertiarySystemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNav()
    }
    
}

extension FriendsVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
