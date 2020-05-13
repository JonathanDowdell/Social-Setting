//
//  FeedController.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/17/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class FeedVC: UITableViewController {
    
    private var startingFrame:CGRect?
    private let searchController = UISearchController()
    private var whatsNewHeight: CGFloat = 82
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNav()
    }
    
}




// MARK: - Navigation Configurations
extension FeedVC {
    fileprivate func configureNav() {
        searchController.searchBar.placeholder = "Search for a username"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.searchController?.hidesBottomBarWhenPushed = true
        tableView.backgroundColor = .tertiarySystemBackground
        
        let frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        self.navigationItem.setLeftBarButtonItems([
            UIBarButtonItem(customView: UIImageView(frame: frame, image: UIImage(named: "logo20px"))),
            UIBarButtonItem(customView: SSTitleLabel(textAlignment: .left, font: UIFont.preferredFont(forTextStyle: .headline)
                , title: "Social Setting"))
        ], animated: true)
        self.navigationItem.title = ""
        
        let optionBtn: SSButton = SSButton(frame: frame, image: UIImage(systemName: "ellipsis"))
        let optionsButton = UIBarButtonItem(customView: optionBtn)
        let searchBtn: SSButton = SSButton(frame: frame, image: UIImage(systemName: "magnifyingglass"))
        searchBtn.addTarget(self, action: #selector(enableSearch), for: .touchUpInside)
        let searchButton = UIBarButtonItem(customView: searchBtn)
        optionsButton.width = 30
        searchButton.customView?.alpha = 0
        searchButton.width = 30
        self.navigationItem.setRightBarButtonItems([
            optionsButton,
            searchButton
        ], animated: true)
    }
    
    @objc fileprivate func enableSearch() {
        searchController.searchBar.becomeFirstResponder()
    }
}




// MARK: - TableView Configurations
extension FeedVC {
    fileprivate func configureTableView() {
        self.tableView.backgroundColor = .tertiarySystemBackground
        self.tableView.register(SSWhatsNewCell.self, forCellReuseIdentifier: SSWhatsNewCell.reuseIdentifier)
        self.tableView.register(SSTableViewPostCell.self, forCellReuseIdentifier: SSTableViewPostCell.reuseIdentifier)
        self.tableView.separatorColor = .clear
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0:
                return 1
            default:
                return 5
            }
        }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch indexPath.section {
            case 0:
                return whatsNewHeight
            case 1:
                let data = "Life is Good!"
                // Estimation of Height from Data
                let appoxWidth = view.frame.width - 30 - 5 - 10
                let size = CGSize(width: appoxWidth, height: 1000)
                let atti = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
                let estimatedFrame = NSString(string: data).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: atti, context: nil)
                print(estimatedFrame.height + 180)
                return estimatedFrame.height + 180 // +300 Photo
            default:
                return 0
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: SSWhatsNewCell.reuseIdentifier, for: indexPath) as! SSWhatsNewCell
                cell.delegate = self
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: SSTableViewPostCell.reuseIdentifier, for: indexPath)
                return cell
            default:
                return UITableViewCell()
            }
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            switch indexPath.section {
            case 0:
                openWhatsNew()
            default:
                print("Nothing")
            }
        }
}




// MARK: - Scroll Configurations
extension FeedVC {
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == 0 {
            UIView.animate(withDuration: 0.2) {
                self.navigationItem.rightBarButtonItems?.last?.customView?.alpha = 0
            }
        } else if scrollView.contentOffset.y > 0 {
            UIView.animate(withDuration: 0.2) {
                self.navigationItem.rightBarButtonItems?.last?.customView?.alpha = 1
            }
        }
        closeWhatsNew()
    }
}




// MARK: - SSWhatsNew Logic
extension FeedVC: SSWhatsNewDelegate {
    func startedEditing() {
        openWhatsNew()
    }
    
    fileprivate func openWhatsNew() {
        whatsNewHeight = 82 * 2.5
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    fileprivate func closeWhatsNew() {
        if whatsNewHeight != 82 {
            whatsNewHeight = 82
            self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }
    }
}
