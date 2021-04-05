//
//  RecipeDetailViewController.swift
//  CovidGains
//
//  Created by Praful Chunchu on 2/13/21.
//

import UIKit
import Firebase
import Photos
import FirebaseStorage
class RecipeDetailViewController: UIViewController {
    // testing
    var recipName = ""
    var recipeIngAndSteps = ""
    var recipeImage = ""
    var idNutrition = 0
    
    @IBOutlet var recipeTitle: UILabel!
    
   // @IBOutlet var Ingredients: UILabel!
    
    @IBOutlet var imageDownloaded: UIImageView!
    
    @IBOutlet weak var ingSteps: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlYourURL = URL(string: recipeImage)
        self.imageDownloaded.loadurl(url: urlYourURL!)
 
        recipeTitle.text = recipName
        //Ingredients.text = recipeIngAndSteps
        ingSteps.text = recipeIngAndSteps
        
        
    }
    

    @IBAction func nutritionClicked(_ sender: Any) {
        guard let nutrionV = self.storyboard?.instantiateViewController(identifier: "nutritonDetail") as? NutritionViewController else{
            return
        }
        print(idNutrition)
        nutrionV.getId = idNutrition
        
        self.navigationController?.pushViewController(nutrionV, animated: true)
        
    }
    
    
    
    
}
extension UIImageView {
    func loadurl(url: URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
        
    }
}

