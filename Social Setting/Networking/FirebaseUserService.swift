//
//  UserServiceImpl.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 5/13/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseUserService: UserService {
    
    func signInUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let _error = error as NSError? {
                completion(.failure(_error))
                return
            }
            
            if let _user = authResult?.user {
                let user = User(uid: _user.uid, displayName: _user.displayName ?? "User", email: email)
                completion(.success(user))
                return
            }
        }
    }
    
    func signUpUser(email: String, username: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResults, error) in
            if let _error = error as NSError? {
                completion(.failure(_error))
                return
            }
            
            if let _user = authResults?.user {
                let changeRequest = _user.createProfileChangeRequest()
                changeRequest.displayName = _user.displayName
                let user = User(uid: _user.uid, displayName: username, email: email)
                changeRequest.commitChanges { (error) in
                    completion(.success(user))
                    return
                }
            }
        }
    }
    
    func checkStatus(completion: @escaping (Result<User, Error>) -> ()) {
        if let _user = Auth.auth().currentUser {
            let user = User(uid: _user.uid, displayName: _user.displayName ?? "", email: _user.email ?? "")
            completion(.success(user))
            return
        } else {
            let error = SSGeneralError(title: "Signed Out", description: "You are signed out", code: 0)
            completion(.failure(error))
        }
    }
    
}
