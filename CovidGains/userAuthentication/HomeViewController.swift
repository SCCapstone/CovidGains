//
//  HomeViewController.swift
//  CovidGains
//
//  Created by Maitri Patel on 4/25/21.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUserAndConfigure()

        // Do any additional setup after loading the view.
    }
    
    func authenticateUserAndConfigure() {
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async {
                let mainVC = self.storyboard?.instantiateViewController(identifier: "MainScreen")as? ViewController
                //mainVC?.selectedViewController = mainVC?.viewControllers?[0]
                 
                //inicating the tabbar
                guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
                    return
                }
                //opens the window
                sceneDelegate.window?.rootViewController = mainVC

            }
        }else{
            let myTabBar = storyboard?.instantiateViewController(identifier: "myTabBar")as? UITabBarController
            myTabBar?.selectedViewController = myTabBar?.viewControllers?[0]
             
            //inicating the tabbar
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
                return
            }
            //opens the window
            sceneDelegate.window?.rootViewController = myTabBar

        }

    }


}
