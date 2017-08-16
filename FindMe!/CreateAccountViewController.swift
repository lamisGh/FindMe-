//
//  CreateAccountViewController.swift
//  FindMe!
//
//  Created by lamis ghanayem on 8/16/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateAccountViewController: UIViewController {
    
    
    @IBOutlet weak var FirstTextField: UITextField!
    
    
    @IBOutlet weak var LastTextField: UITextField!
  
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBAction func Save(_ sender: Any) {
        
        guard let firUser = Auth.auth().currentUser,
            let firstname = FirstTextField.text,
            
            !firstname.isEmpty else { return }
        
            let lastname = LastTextField.text
    
            if !(lastname?.isEmpty)! { return }
        
        let email = EmailTextField.text
        
        if !(email?.isEmpty)! { return }
        
        let password = PasswordTextField.text
        
        if !(password?.isEmpty)! { return }

        
        
        UserService.create(firUser, firstname: firstname, lastname: lastname, email: email, password: password!) { (user) in
            guard let user = user else {
                // handle error
                return
            }
            
            User.setCurrent(user)
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            if let initialViewController = storyboard.instantiateInitialViewController() {
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            }
        
        
        
        
        
        
    }
    
        
        
    }
    
    

}
