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
    
    
    
    @IBOutlet weak var errorL: UILabel!
    
    
    
    
    @IBAction func tappedCancel(_ sender: UIBarButtonItem) {
        let outC = storyboard?.instantiateViewController(identifier: "MainScreen") as? ViewController
        
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else{
            return
        }
        
        sceneDelegate.window?.rootViewController = outC
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            Auth.auth().createUser(withEmail: email, password: password) {  authResult, error in
            
                
                if error != nil{
                    self.errorL.text = error?.localizedDescription
                    self.errorL.alpha = 1
                    
                }else{
                    
                    //self.performSegue(withIdentifier: "RegisterToGrosh", sender: self)
                    let homeVC = self.storyboard?.instantiateViewController(identifier: "myTabBar")
                    self.view.window?.rootViewController = homeVC
                    self.view.window?.makeKeyAndVisible()
                }
                
                
      
      
                
                
                
                
                
                
                
                
            }
        }
    }
}
