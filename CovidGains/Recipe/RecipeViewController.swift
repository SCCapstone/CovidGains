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
    
    var ingr = ["Pasta, \nBroccoli florets, \nBasil leaves, \nGarlic cloves, \nPine nuts, \nVirgin olive oil, \nSalt, \nParmigiano-reggiano", "potatoes, milk, butter, pepper", "chicken, garlic, lemon, salt, pepper, oregano", "onion, oil, carrot, parsley, basil, water", "macaroni cheese, cheddar cheese, milk, butter, flour, paprika", "potatoes, oil, pepper, salt", "tomatoes, olives, cheese, pepper, spaghetti, oil", "brown rice, nuts, butter, nutmeg, water", "beef, pork, cheese, onion, garlic, basil, parsley, oregano", "chicken, alfredo sauce, oil, heavy cream, nutmeg, butter, boneless chicken, fettuccine"]
    
    var direct = ["Step 1: Boil water in a large pot \nStep 2: Add broccoli with boil water ", "Step2", "Step3", "Step4", "Step", "Step", "Step", "Step", "Step", "Step"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController
        vc?.name = imageArr[indexPath.row]
        vc?.ingre = ingr[indexPath.row]
        vc?.st = direct[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
