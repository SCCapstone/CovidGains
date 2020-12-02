//
//  RecipeViewController.swift
//  CovidGains
//
//  Created by Maitri Patel on 10/25/20.
//

import UIKit

class RecipeViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArr = ["Broccoli Pesto Pasta", "Mashed Potatoes", "Lemon Chicken", "Pasta with Chickpea Sauce", "Mac and Cheese", "Smoky Potatoes", "Greek Spaghetti", "Nutty Rice", "Meatball", "Alfraedo Chicken"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        dishes = ["stir fry", "burger", "pizza", "spaghetti", "alfredo", "sandwich", "macaroni"]
        dishes["stir fry"] = {"pepper", "onion", "rice", "chicken}
        dishes["burger"] = {"lettuce", "onion", "ground beef"}
        dishes["pizza"] = {"pepperoni", "cheese", "flour", "tomato"}
        dishes["spaghetti"] = {"meatball", "pasta"}
        dishes["alfredo"] = {"chicken", "pasta"}
        dishes["sandwich"] = {"lettuce", "tomato", "ham", "bacon"]
        dishes["macaroni"] = {"pasta", "milk", "butter", "cheese"}
        */
        
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


extension RecipeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath : IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DataCollectionViewCell
        cell?.img.image = UIImage(named: imageArr[indexPath.row])
        cell?.lbl.text = imageArr[indexPath.row]
        
        return cell!
    }
}
