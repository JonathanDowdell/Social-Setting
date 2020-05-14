//
//  SSErrorProtocol.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 5/13/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import Foundation

protocol SSErrorProtocol: LocalizedError {
    var title: String? { get }
    var code: Int { get }
}
