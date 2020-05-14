//
//  UserService.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 5/13/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol UserService {
    func signUpUser(email:String, username:String, password:String, completion: @escaping (Result<User, Error>) -> ())
    
    func signInUser(email:String, password:String, completion: @escaping (Result<User, Error>) -> ())
    
    func checkStatus(completion: @escaping (Result<User, Error>) -> ()) 
}
