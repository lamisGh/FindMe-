//
//  User.swift
//  FindMe!
//
//  Created by lamis ghanayem on 8/15/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation

import FirebaseDatabase.FIRDataSnapshot

class User {
    
    let uid: String
    let firstname: String
    let lasttname: String
    let gender: String
    let user = User.current
    
    // MARK: - Init
    
    init(uid: String, firstname: String, lasttname: String, gender: String) {
        
        
        self.uid = uid
        self.firstname = firstname
         self.lasttname = lasttname
        self.gender = gender
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let firstname = dict["firstname"] as? String,
            let lasttname = dict["lastname"] as? String,
            let email = dict["email"] as? String,
            let password = dict["password"] as? String,
            let gender = dict["gender"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.firstname = firstname
        self.lasttname = lasttname
         self.email = email
         self.password = password
        self.gender = gender
    }
    // MARK: - Singleton
    
    // 1
    private static var _current: User?
    
    // 2
    static var current: User {
        // 3
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        
        // 4
        return currentUser
    }
    
    // MARK: - Class Methods
    
    // 5
    static func setCurrent(_ user: User) {
        _current = user
    }
}
