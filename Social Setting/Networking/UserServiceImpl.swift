//
//  UserServiceImpl.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 5/13/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseUserServiceImpl: UserService {
    
    func signInUser(email: String, password: String, completion: @escaping (User?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let _error = error {
                print(_error.localizedDescription)
                completion(nil)
                return
            }
            
            if let _user = authResult?.user {
                let user = User(uid: _user.uid, displayName: _user.displayName ?? "Social User", email: email)
                completion(user)
                return
            }
            
            completion(nil)
        }
    }
    
    func signUpUser(email: String, username: String, password: String, completion: @escaping (User?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResults, error) in
            if let _error = error {
                print(_error.localizedDescription)
                completion(nil)
                return
            }
            
            if let _user = authResults?.user {
                let changeRequest = _user.createProfileChangeRequest()
                changeRequest.displayName = _user.displayName
                let user = User(uid: _user.uid, displayName: username, email: email)
                changeRequest.commitChanges { (_) in
                    completion(user)
                    return
                }
            }
            
            completion(nil)
        }
    }
    
}
