//
//  ProfileVC.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 2/5/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class ProfileVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCells()
        configureNav()
        
    }
    
}

// MARK: - Navigation Configurations
extension ProfileVC {
    
    fileprivate func configureNav() {
        self.navigationItem.title = "@mettaworldj"
        self.navigationItem.titleView?.backgroundColor = .systemBlue
        let frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        let options = UIBarButtonItem(customView: SSButton(frame: frame, image: UIImage(systemName: "ellipsis")))
        options.width = 30
        self.navigationItem.setRightBarButtonItems([
            options,
        ], animated: true)
    }
    
}

// MARK: - TableView Configurations
extension ProfileVC {
    
    fileprivate func configureCells() {
        self.tableView.backgroundColor = .tertiarySystemBackground
        self.tableView.separatorStyle = .none
        tableView.register(ProfileInfoCell.self, forCellReuseIdentifier: ProfileInfoCell.reuseIdentifier)
        tableView.register(SSTableViewPostCell.self, forCellReuseIdentifier: SSTableViewPostCell.reuseIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 4
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let profileInfoCell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoCell.reuseIdentifier, for: indexPath)
            return profileInfoCell
        default:
            let profileInfoCell = tableView.dequeueReusableCell(withIdentifier: SSTableViewPostCell.reuseIdentifier, for: indexPath)
            return profileInfoCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 416
        default:
            let data = "Life is Good!"
            // Estimation of Height from Data
            let appoxWidth = view.frame.width - 30 - 5 - 10
            let size = CGSize(width: appoxWidth, height: 1000)
            let atti = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
            let estimatedFrame = NSString(string: data).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: atti, context: nil)
            return estimatedFrame.height + 180
        }
    }
}


