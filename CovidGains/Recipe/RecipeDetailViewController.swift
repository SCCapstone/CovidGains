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
    var recipeImage = ""


    
    @IBOutlet var recipeTitle: UILabel!
    
    @IBOutlet var Ingredients: UILabel!
    
    @IBOutlet var imageDownloaded: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlYourURL = URL(string: "https://spoonacular.com/recipeImages/char-grilled-beef-tenderloin-with-three-herb-chimichurri-156992.jpg")
        
        self.imageDownloaded.loadurl(url: urlYourURL!)
        
        recipeTitle.text = recipName
        Ingredients.text = recipeIngredients
        
        //Directions.text = "On the Job: Pan Roasted Cauliflower From Food52 is a <b>dairy free</b> side dish. One portion of this dish contains roughly <b>7g of protein</b>, <b>26g of fat</b>, and a total of <b>350 calories</b>. This recipe serves 4. For <b>$1.99 per serving</b>, this recipe <b>covers 20%</b> of your daily requirements of vitamins and minerals. This recipe is liked by 225 foodies and cooks. A mixture of breadcrumbs, rosemary, sea salt, and a handful of other ingredients are all it takes to make this recipe so tasty. From preparation to the plate, this recipe takes around <b>20 minutes</b>. All things considered, we decided this recipe <b>deserves a spoonacular score of 97%</b>. This score is tremendous. Food52's Roasted Broccoli with Smoked Paprika Vinaigrette and Marconan Almonds</a>,spoonacular.com/recipes/sheet-pan-chicken-cauliflower-921598 onacular.com/recipes/sheet-pan-roasted-broccoli-918006"
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let ref = storageRef.child(recipName + ".jpg")
        //imageDownloaded.sd_setImage(with: ref)
        
        //scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: Directions.bottomAnchor).isActive = true

        // Do any additional setup after loading the view.
        
        
    }
    
//    extension UIImageView {
//        func loadurl(url: URL){
//            DispatchQueue.global().async { [weak self] in
//                if let data = try? Data(contentsOf: url) {
//                    if let image = UIImage(data: data) {
//                        Dispatch.main.async {
//                            self?.image = image
//                        }
//                    }
//                }
//            }
//
//        }
//    }
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

