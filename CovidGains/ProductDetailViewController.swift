//
//  ProductDetailViewController.swift
//  Created by CAREY, ROBERT T on 10/9/20.
//  Copyright © 2020 CAREY, ROBERT T. All rights reserved.
//

import UIKit
class ProductDetailViewController: UIViewController {
    var produce = [String]()
    var expirT = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        produce = ["apple", "apricots", "avocado", "banana", "blackberries", "blackcurrant", "blueberries", "breadfruit", "cantaloupe", "carambola", "cherimoya", "cherries", "clementine", "coconut", "cranberries", "custard-apple", "date fruit", "durian", "elderberries", "figs", "gooseberries", "grapefruit", "grapes", "guava", "honeydew melon", "jackfruit", "java-plum", "jujube fruit", "kiwifruit", "kumquat", "lemon", "longan", "loquat", "lychee", "mandarin", "mango", "mangosteen", "mulberries", "nectarine", "olives", "orange", "papaya", "passion fruit", "peaches", "pear", "persimmon", "pitaya", "dragonfruit", "pineapple", "plantain", "plums", "pomegranate", "prickly pear", "prunes", "pummelo", "quince", "raspberies", "rhubarb", "rose-apple", "sapodilla", "tamarind", "watermelon", "amaranth leaves", "artichoke", "arugula", "asparagus", "bamboo shoots", "green beans", "beets", "belgian endive", "bitter melon", "bok choy", "broadbeans", "broccoli", "broccoli rabe", "russel sprouts", "green cabbage", "red cabbage", "carrot", "cassava", "cauliflower", "celeriac", "celery root", "celery", "chayote", "chicory", "collards", "corn", "crookneck", "cucumber", "daikon", "dandelion greens", "edamame", "eggplant", "fennel", "fiddleheads", "ginger root", "horseradish", "jicama", "kale", "kohlrabi", "leeks", "iceberg lettuce", "lettuce", "romaine lettuce", "mushrooms", "mustard greens", "okra", "red onion", "onions", "parsnip", "green peas", "green pepper", "red pepper", "red potato", "white potato", "yellow potato", "pumpkin", "radicchio", "radishes", "rutabaga", "oysterplant", "shallots", "snow peas", "sorrel", "spaghetti squash", "spinach", "butternut squash", "sugar snap peas", "sweet potato", "swiss chard", "tomatillo", "tomato", "turnip", "watercress", "yam root", "zucchini"]
        // Do any additional setup after loading the view.
        
        expirT = [35, 49, 15, 7, 5, 6, 14, 3, 10, 30, 4, 10, 14, 21, 28, 7, 31, 5, 4, 10, 3, 42, 14, 4, 10, 3, 5,  28, 20, 14, 28, 7, 10, 3, 14, 5, 21, 5, 5, 22, 10, 7, 14, 4, 12, 2, 30, 5, 5, 4, 5, 14, 4, 8, 5, 5, 5, 7, 42, 7, 84, 7, 6, 7, 10, 4, 14, 5, 14, 28, 5, 5, 3, 5, 5, 4, 50, 50, 10, 30, 14, 28, 15, 14, 28, 6, 5, 4, 5, 14, 14, 21, 2, 8, 12, 10, 30, 35, 3, 14, 5, 14, 28, 30, 27, 5, 7, 4, 29, 29, 21, 4, 10, 10, 37, 37, 37, 80, 60, 14, 50, 60, 14, 5, 14, 14, 7, 50, 5, 7, 50, 50, 14, 7, 3, 7, 14]
    }
    
    // TODO add produce type detection for num of days
    var pName: String = ""
    @IBOutlet weak var productName: UITextField!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            pName = productName.text!.lowercased()
            for item in produce {
                if item == pName {
                   print("found", item)
                }
            }
            
            
        }
    }
    
    


}
