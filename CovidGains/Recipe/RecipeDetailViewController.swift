//
//  RecipeDetailViewController.swift
//  CovidGains
//
//  Created by Praful Chunchu on 2/13/21.
//

import UIKit
import Firebase
class RecipeDetailViewController: UIViewController {
    
    var recipName = ""
    var recipeIngredients = ""
    var recipeDetails = ""
    
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var Ingredients: UITextView!
    @IBOutlet weak var Directions: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTitle.text = recipName
        Ingredients.text = recipeIngredients
        Directions.text = recipeDetails
        
        

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
