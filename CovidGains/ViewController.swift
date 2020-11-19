//
//  ViewController.swift
//  CovidGains
//
//  Created by Maitri Patel on 9/13/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func HomeButton(_ sender: Any) {
        
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

