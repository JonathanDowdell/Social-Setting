//
//  User.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 5/13/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import Foundation

struct User: Decodable {
    let uid: String
    let displayName: String
    let email: String
}
