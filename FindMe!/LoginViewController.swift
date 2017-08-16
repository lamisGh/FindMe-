//
//  LoginViewController.swift
//  FindMe!
//
//  Created by lamis ghanayem on 8/15/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController{
    
    @IBAction func Create(_ sender: Any) {
        // 1
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // 2
        authUI.delegate = self as FUIAuthDelegate
        
        // 3
   //     let authViewController = authUI.authViewController()
      //  present(authViewController, animated: true)
    }
    
    }
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        // 1
        guard let user = user
            else { return }
        
        // 2
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        // 3
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            
                // 1
                if let userDict = snapshot.value as? [String : Any] {
                    print("User already exists \(userDict.debugDescription).")
                } else {
                    print("New user!")
                }
            })
       
    }
}

