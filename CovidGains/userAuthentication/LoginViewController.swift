//
//  LoginViewController.swift
//  CovidGains
//
//  Created by Praful Chunchu on 12/4/20.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController{
    
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func tappedCancel(_ sender: UIBarButtonItem) {
        let outC = storyboard?.instantiateViewController(identifier: "MainScreen") as? ViewController
        
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else{
            return
        }
        
        sceneDelegate.window?.rootViewController = outC
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
           
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
               // print("Login user", email)
                
                if error != nil{
                    print(error?.localizedDescription)
                    self.errorLabel.text = error?.localizedDescription
                    //self.errorLabel.alpha = 1
                    
                }else{
                    print("Still going to go !!")
                    //self.performSegue(withIdentifier: "LoginToGrosh", sender: self)
                }
                
                
                
                
//                if let e = error
//                {
//                    print(e)
//                }
//                else
//                {
//                    self.performSegue(withIdentifier: "LoginToGrosh", sender: self)
//
//                }
        
            }
          
        }
    }
    
    
    
    
}
