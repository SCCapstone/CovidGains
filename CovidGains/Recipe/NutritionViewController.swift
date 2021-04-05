//
//  NutritionViewController.swift
//  CovidGains
//
//  Created by Praful Chunchu on 4/4/21.
//

import UIKit

class NutritionViewController: UIViewController {
    
    var getId = 0
    
    @IBOutlet var nutritonInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNutrition()
        
    }
    
    func getNutrition(){
        var calories: String = ""
        var carbs: String = ""
        var fat: String = ""
        var protein: String = ""
        
        let headers = [
            "x-rapidapi-key": "3989959899mshfeb4d8905d820ccp1dc37bjsn1049a6d50381",
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/" + String(getId) + "/nutritionWidget.json")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                
                do {
                    if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary{ //converted JSON objec to dictonary
                        calories = convertedJsonIntoDict["calories"] as! String
                        carbs = convertedJsonIntoDict["carbs"] as! String
                        fat = convertedJsonIntoDict["fat"] as! String
                        protein = convertedJsonIntoDict["protein"] as! String
                        
                        DispatchQueue.main.async {
                            
                            self.nutritonInfo.text = "Calories - " + calories + "\n" + "Carbs - " + carbs + "\n" + "Fat - " + fat + "\n" + "Protein - " + protein
                        }
                        
                    }
                    
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        })
        
        dataTask.resume()
    }
    
    
    
}
