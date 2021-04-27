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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //calls to load data from firebase
    }
    
    @IBAction func tappedCancel(_ sender: UIBarButtonItem) {
        let outC = storyboard?.instantiateViewController(identifier: "MainScreen") as? ViewController
        
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else{
            return
        }
        
        sceneDelegate.window?.rootViewController = outC
        
    }
    func loginHelper(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            if error != nil{
                self.errorLabel.text = error?.localizedDescription
                self.errorLabel.alpha = 1
            }


        }
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            
                    Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
               // print("Login user", email)
                
                if error != nil{
                    //print(error?.localizedDescription)
                    self.errorLabel.text = error?.localizedDescription
                    self.errorLabel.alpha = 1
                    //return error
                    
                }else{
                    let myTabBar = self.storyboard?.instantiateViewController(identifier: "myTabBar")as? UITabBarController
                    myTabBar?.selectedViewController = myTabBar?.viewControllers?[0]
                     
                    //inicating the tabbar
                    guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
                        return
                    }
                    //opens the window
                    sceneDelegate.window?.rootViewController = myTabBar
                    
                    self.dismiss(animated: true, completion: nil)
                    

                }

            }
          
        }
    }
    
    
    
    
}
