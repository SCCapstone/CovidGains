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
    
    var ingr = ["Ingr1", "Ingr2", "Ingr3", "Ingr4", "Ingr", "Ingr", "Ingr", "Ingr", "Ingr", "Ingr"]
    
    var direct = ["Step1", "Step2", "Step3", "Step4", "Step", "Step", "Step", "Step", "Step", "Step"]
    
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
