//
//  RecipeTableView.swift
//  CovidGains
//
//  Created by Praful Chunchu on 2/12/21.
//

import UIKit
import Firebase
import FirebaseStorage
import Photos
import FirebaseUI
import Foundation

class RecipeTableView: UITableViewController {
    
    let db = Firestore.firestore()
    var recipeData = [myRecipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // loadRecipeAPI()
        loadRecipeData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    func loadRecipeData()
    {
        self.db.collection("Recipes").getDocuments { (querySnapshot, error) in
            if let e = error{
                print("The error is : \(e)")
                
            }else{
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        let docID = doc.documentID
                        
                        let recipe = myRecipe(recipeName: docID, directions: data["directions"] as! String, ingredients: data["ingredients"] as! String, identifier: "id_\(docID)")
                        self.recipeData.append(recipe)
                        
                        DispatchQueue.main.async{
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipeData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rCell", for: indexPath)
        
        cell.textLabel?.text = recipeData[indexPath.row].recipeName
        // Configure the cell...
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let recp = self.storyboard?.instantiateViewController(identifier: "Detail") as? RecipeDetailViewController else{
            return
        }
        self.navigationController?.pushViewController(recp, animated: true)
//        var recpID = "479101"
//        var name = "name:\n"
//        var ingreds = "Ingredients:\n"
//        var steps = "Instructions:\n"
//        let headers = [
//            "x-rapidapi-key": "3989959899mshfeb4d8905d820ccp1dc37bjsn1049a6d50381",
//            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
//        ]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/" + recpID + "/information")! as URL,cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
//
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
//            if (error != nil && data == nil) {
//                print("error" , error)
//            } else {
//
//                do {
//                    if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] { //converted JSON objec to dictonary
//                        let name = convertedJsonIntoDict["title"] as! String
//
//                        if let analyzedInstrJSON = convertedJsonIntoDict["analyzedInstructions"] as? NSArray{
//                            if let analyzedStepsJSON = analyzedInstrJSON[0] as? NSDictionary{
//                                if let stepsSteps = analyzedStepsJSON["steps"] as? NSArray{
//
//                                    var i = 0
//
//                                    for index in stepsSteps{
//                                        if let dictStep = stepsSteps[i] as? NSDictionary{
//                                            let step = dictStep["step"] as! String
//                                            steps += ("Step " + String(i+1) + ": " + step + "\n")
//                                            i += 1
//                                        }
//                                    }
//
//                                }
//                            }
//                        }
//                    }
//
//                    if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary { //converted JSON objec to dictonary
//
//                        if let extendedIngredJSON = convertedJsonIntoDict["extendedIngredients"] as? NSArray{
//                            var j = 0
//
//                            for index in extendedIngredJSON
//                            {
//                                if let embeddedIngredJSON = extendedIngredJSON[j] as? NSDictionary{
//                                    if let ingred = embeddedIngredJSON["original"] {
//                                        ingreds += (ingred as! String) + "\n"
//                                    }
//                                }
//                                j += 1
//                            }
//
//                        }
//
//                    }
//
        //                    if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] { //converted JSON objec to 
        //                    }
        
//
//                    DispatchQueue.main.async {
//                        //recp.recipeTitle = steps
//                        recp.recipeIngredients = ingreds
//                        recp.recipeDetails = steps
//                        self.navigationController?.pushViewController(recp, animated: true)
//                    }
//
//                } catch let error as NSError {
//                    print(error.localizedDescription)
//                }
//
//            }
//        }
//
//        dataTask.resume() //API call made!
        
    }
    
}

struct myRecipe{
    let recipeName: String
    let directions: String
    let ingredients: String
    let identifier: String
    
}
