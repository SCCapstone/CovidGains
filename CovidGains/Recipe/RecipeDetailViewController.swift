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
    var recipeIngredients = ""
    var recipeDetails = ""
    
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var Ingredients: UITextView!
    @IBOutlet weak var Directions: UITextView!
    
    @IBOutlet var imageDownloaded: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTitle.text = recipName
        Ingredients.text = recipeIngredients.replacingOccurrences(of: "\\n", with: "\n")
        Directions.text = recipeDetails.replacingOccurrences(of: "\\n", with: "\n")
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let ref = storageRef.child(recipName + ".jpg")
        imageDownloaded.sd_setImage(with: ref)

        // Do any additional setup after loading the view.
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
