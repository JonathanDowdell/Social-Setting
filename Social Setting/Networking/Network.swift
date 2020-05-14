//
//  Network.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 5/13/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import Foundation

class Network {
    static let shared = Network()
    
    private init() {}
    
    let userService: UserService = FirebaseUserServiceImpl()
    
}
