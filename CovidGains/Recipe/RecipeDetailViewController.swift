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
    var idNutrition = ""
    
    @IBOutlet var recipeTitle: UILabel!
    
    @IBOutlet var Ingredients: UILabel!
    
    @IBOutlet var imageDownloaded: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlYourURL = URL(string: "https://spoonacular.com/recipeImages/char-grilled-beef-tenderloin-with-three-herb-chimichurri-156992.jpg")
        self.imageDownloaded.loadurl(url: urlYourURL!)
 
        recipeTitle.text = "recipName"
        Ingredients.text = "recipeIngAndSteps"
        
    }
    

    @IBAction func nutritionClicked(_ sender: Any) {
        guard let nutrionV = self.storyboard?.instantiateViewController(identifier: "nutritonDetail") as? NutritionViewController else{
            return
        }
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

