//
//  RegisterViewController.swift
//  CovidGains
//
//  Created by Praful Chunchu on 12/3/20.
//

import Foundation
import UIKit
import Firebase

class RegisterViewController: UIViewController{
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) {  authResult, error in
            
                if let e = error
                {
                    print(e)
                }
                else{
                    self.performSegue(withIdentifier: "RegisterToGrosh", sender: self)
                    
                }
            
      
            }
        }
    }
}
