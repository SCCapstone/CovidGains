//
//  AddViewController.swift
//  Created by CAREY, ROBERT T on 10/9/20.
//  Copyright © 2020 CAREY, ROBERT T. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController {

    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    @IBOutlet var titleField : UITextField! //product names
    @IBOutlet var bodyField : UITextField! //quantity
    @IBOutlet var datePicker : UIDatePicker! //date entered
    
    public var completion: ((String, String, Date)-> Void)?
    
    var products = [String]()
    var expirTime = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        products = ["apple", "apricots", "avocado", "banana", "blackberries", "blackcurrant", "blueberries", "breadfruit", "cantaloupe", "carambola", "cherimoya", "cherries", "clementine", "coconut", "cranberries", "custard-apple", "date fruit", "durian", "elderberries", "figs", "gooseberries", "grapefruit", "grapes", "guava", "honeydew melon", "jackfruit", "java-plum", "jujube fruit", "kiwifruit", "kumquat", "lemon", "longan", "loquat", "lychee", "mandarin", "mango", "mangosteen", "mulberries", "nectarine", "olives", "orange", "papaya", "passion fruit", "peaches", "pear", "persimmon", "pitaya", "dragonfruit", "pineapple", "plantain", "plums", "pomegranate", "prickly pear", "prunes", "pummelo", "quince", "raspberies", "rhubarb", "rose-apple", "sapodilla", "tamarind", "watermelon", "amaranth leaves", "artichoke", "arugula", "asparagus", "bamboo shoots", "green beans", "beets", "belgian endive", "bitter melon", "bok choy", "broadbeans", "broccoli", "broccoli rabe", "russel sprouts", "green cabbage", "red cabbage", "carrot", "cassava", "cauliflower", "celeriac", "celery root", "celery", "chayote", "chicory", "collards", "corn", "crookneck", "cucumber", "daikon", "dandelion greens", "edamame", "eggplant", "fennel", "fiddleheads", "ginger root", "horseradish", "jicama", "kale", "kohlrabi", "leeks", "iceberg lettuce", "lettuce", "romaine lettuce", "mushrooms", "mustard greens", "okra", "red onion", "onions", "parsnip", "green peas", "green pepper", "red pepper", "red potato", "white potato", "yellow potato", "pumpkin", "radicchio", "radishes", "rutabaga", "oysterplant", "shallots", "snow peas", "sorrel", "spaghetti squash", "spinach", "butternut squash", "sugar snap peas", "sweet potato", "swiss chard", "tomatillo", "tomato", "turnip", "watercress", "yam root", "zucchini"]
        
        expirTime = [35, 49, 15, 7, 5, 6, 14, 3, 10, 30, 4, 10, 14, 21, 28, 7, 31, 5, 4, 10, 3, 42, 14, 4, 10, 3, 5,  28, 20, 14, 28, 7, 10, 3, 14, 5, 21, 5, 5, 22, 10, 7, 14, 4, 12, 2, 30, 5, 5, 4, 5, 14, 4, 8, 5, 5, 5, 7, 42, 7, 84, 7, 6, 7, 10, 4, 14, 5, 14, 28, 5, 5, 3, 5, 5, 4, 50, 50, 10, 30, 14, 28, 15, 14, 28, 6, 5, 4, 5, 14, 14, 21, 2, 8, 12, 10, 30, 35, 3, 14, 5, 14, 28, 30, 27, 5, 7, 4, 29, 29, 21, 4, 10, 10, 37, 37, 37, 80, 60, 14, 50, 60, 14, 5, 14, 14, 7, 50, 5, 7, 50, 50, 14, 7, 3, 7, 14]
        
        
        
    }
    
    @IBAction func tappedSave(_ sender: Any) {
        if let titleText = titleField.text, !titleText.isEmpty, let bodyText = bodyField.text, !bodyText.isEmpty{
            
            let targetDate = datePicker.date
            var dateComponent = DateComponents()
            //dateComponent.day = 0 //to test
            
            var i = 0
            
            for item in products {
                if item == titleField.text! {
                    dateComponent.day = expirTime[i]
                    //print("dateComp",dateComponent)
                    //prodStr += " (" + String(expirTime[i]) + " days)"
                }
                i += 1
            }
            
            //to add days to the current date
            let futureDate = Calendar.current.date(byAdding: dateComponent, to: targetDate)
 
            //let date = targetDate
            //let formatter = DateFormatter()
           // formatter.dateFormat = "MM - dd - YYYY"
            //print("Todays date",formatter.string(from: date))

            //let newDate = futureDate!
            //print("Upcoming date", formatter.string(from: newDate))
            
            
            completion?(titleText, bodyText, futureDate!)

            }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}


