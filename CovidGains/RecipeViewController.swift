//
//  RecipeViewController.swift
//  CovidGains
//
//  Created by Maitri Patel on 10/25/20.
//

import UIKit

class RecipeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dishes = ["stir fry", "burger", "pizza", "spaghetti", "alfredo", "sandwich", "macaroni"]
        dishes["stir fry"] = {"pepper", "onion", "rice", "chicken}
        dishes["burger"] = {"lettuce", "onion", "ground beef"}
        dishes["pizza"] = {"pepperoni", "cheese", "flour", "tomato"}
        dishes["spaghetti"] = {"meatball", "pasta"}
        dishes["alfredo"] = {"chicken", "pasta"}
        dishes["sandwich"] = {"lettuce", "tomato", "ham", "bacon"]
        dishes["macaroni"] = {"pasta", "milk", "butter", "cheese"}
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
