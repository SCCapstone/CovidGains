//
//  ProductDetailViewController.swift
//  Hello World 2
//
//  Created by CAREY, ROBERT T on 10/9/20.
//  Copyright © 2020 CAREY, ROBERT T. All rights reserved.
//

import UIKit
class ProductDetailViewController: UIViewController {
    var produce = [String]()
    var expirT = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        produce = ["apple", "apricots", "avocado", "banana", "banana", "blackberries", "blackcurrant", "blueberries", "breadfruit", "cantaloupe", "carambola", "cherimoya", "cherries", "clementine", "coconut", "cranberries", "custard-apple", "date fruit", "durian", "elderberries", "feijoa", "figs", "gooseberries", "grapefruit", "grapes", "guava", "honeydew melon", "jackfruit", "java-plum", "jujube fruit", "kiwifruit", "kumquat", "lemon", "longan", "loquat", "lychee", "mandarin", "mango", "mangosteen", "mulberries", "nectarine", "olives", "orange", "papaya", "passion fruit", "peaches", "pear", "persimmon", "pitaya", "dragonfruit", "pineapple", "pitanga", "plantain", "plums", "pomegranate", "prickly pear", "prunes", "pummelo", "quince", "raspberies", "rhubarb", "rose-apple", "sapodilla", "tamarind", "tangerine", "watermelon", "amaranth leaves", "arrowroot", "artichoke", "arugula", "asparagus", "bamboo shoots", "green beans", "beets", "belgian endive", "bitter melon", "bok choy", "broadbeans", "broccoli", "broccoli rabe", "russel sprouts", "green cabbage", "red cabbage", "carrot", "cassava", "yuca root", "cauliflower", "celeriac", "celery root", "celery", "chayote", "chicory", "collards", "corn", "crookneck", "cucumber", "daikon", "dandelion greens", "edamame", "soybeans", "eggplant", "fennel", "fiddleheads", "ginger root", "horseradish", "jicama", "kale", "kohlrabi", "leeks", "iceberg lettuce", "lettuce", "romaine lettuce", "mushrooms", "mustard greens", "okra", "red onion", "onions", "parsnip", "green peas", "green pepper", "red pepper", "red potato", "white potato", "yellow potato", "pumpkin", "radicchio", "radishes", "rutabaga", "salsify", "oysterplant", "shallots", "snow peas", "sorrel", "spaghetti squash", "spinach", "butternut squash", "sugar snap peas", "sweet potato", "swiss chard", "tomatillo", "tomato", "turnip", "watercress", "yam root", "zucchini"]
        
        // Do any additional setup after loading the view.
    }
    //
    
    // TODO add produce type detection for num of days
    var pName: String = ""
    @IBOutlet weak var productName: UITextField!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            pName = productName.text!.lowercased()
            for item in produce {
                if item == pName {
                    print("found")
                }
            }
        }
        
    }
    
    


}
