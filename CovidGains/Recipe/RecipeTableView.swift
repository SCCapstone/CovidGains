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
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let db = Firestore.firestore()
    var recipeData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
       // loadRecipeAPI()
        searchBar.delegate = self
        //getNutrition()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
//    func loadRecipeData()
//    {
//        self.db.collection("Recipes").getDocuments { (querySnapshot, error) in
//            if let e = error{
//                print("The error is : \(e)")
//
//            }else{
//                if let snapshotDocuments = querySnapshot?.documents {
//                    for doc in snapshotDocuments {
//                        let data = doc.data()
//                        let docID = doc.documentID
//
//                        let recipe = myRecipe(recipeName: docID, directions: data["directions"] as! String, ingredients: data["ingredients"] as! String, identifier: "id_\(docID)")
//                        self.recipeData.append(recipe)
//
//                        DispatchQueue.main.async{
//                            self.tableView.reloadData()
//                        }
//                    }
//                }
//            }
//        }
//    }
    
    let query = ""
    func recipeSearch(query: String) {
        recipeData = []
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        
        let headers = [
            "x-rapidapi-key": "3989959899mshfeb4d8905d820ccp1dc37bjsn1049a6d50381",
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=" + query)! as URL,
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
                        if let searchResults = convertedJsonIntoDict["results"] as? NSArray{
                            var i = 0
                            var rname: String
                            for _ in searchResults {
                                if let recipe = searchResults[i] as? NSDictionary {
                                    rname = recipe["title"] as! String
                                    self.recipeData.append(rname)
                                    
                                }
                                i += 1
                            }
                            DispatchQueue.main.async{
                                self.tableView.reloadData()
                            }
                            
                        }
                        
//                        print("calories", calories)
//                        print("carbs", carbs)
//                        print("fat", fat)
//                        print("protein", protein)
                    }

                    DispatchQueue.main.async {
                    }

                } catch let error as NSError {
                    print(error.localizedDescription)
                }

            }
            
        })

        dataTask.resume()
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

        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/1003464/nutritionWidget.json")! as URL,
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
                        
//                        print("calories", calories)
//                        print("carbs", carbs)
//                        print("fat", fat)
//                        print("protein", protein)
                    }

                    DispatchQueue.main.async {
                    }

                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        })

        dataTask.resume()
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
        
        cell.textLabel?.text = recipeData[indexPath.row]
        // Configure the cell...
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var ID = 0
        guard let recp = self.storyboard?.instantiateViewController(identifier: "Detail") as? RecipeDetailViewController else{
            return
        }
        
        self.navigationController?.pushViewController(recp, animated: true)
        
        var headers = [
            "x-rapidapi-key": "3989959899mshfeb4d8905d820ccp1dc37bjsn1049a6d50381",
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]

        var request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=" + query)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        var session = URLSession.shared
        var dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                
                do {
                    if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary{ //converted JSON objec to dictonary
                        if let searchResults = convertedJsonIntoDict["results"] as? NSArray{
                            
                                if let recipe = searchResults[0] as? NSDictionary {
                                    ID = recipe["id"] as! Int
                                    print("in: ", ID)
                                }
                            
                            
                        }
        
                    }


                } catch let error as NSError {
                    print(error.localizedDescription)
                }

            }
            
        })

        dataTask.resume()
        
        
        var name = ""
        var image = ""
        var ingreds = "Ingredients:\n"
        var steps = "Instructions:\n"
        headers = [
            "x-rapidapi-key": "3989959899mshfeb4d8905d820ccp1dc37bjsn1049a6d50381",
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        print("out:", ID)
        request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/" + String(ID) + "/information")! as URL,cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        session = URLSession.shared
        dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if (error != nil && data == nil) {
                print("error" , error as Any)
            } else {

                do {
                    if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary { //converted JSON objec to dictonary

                        name = convertedJsonIntoDict["title"] as! String

                        image = convertedJsonIntoDict["image"] as! String

                        if let analyzedInstrJSON = convertedJsonIntoDict["analyzedInstructions"] as? NSArray{
                            if let analyzedStepsJSON = analyzedInstrJSON[0] as? NSDictionary{
                                if let stepsSteps = analyzedStepsJSON["steps"] as? NSArray{

                                    var i = 0

                                    for _ in stepsSteps{
                                        if let dictStep = stepsSteps[i] as? NSDictionary{
                                            let step = dictStep["step"] as! String
                                            steps += ("Step " + String(i+1) + ": " + step + "\n")
                                            i += 1
                                        }
                                    }

                                }
                            }
                        }
                    }

                    if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary { //converted JSON objec to dictonary

                        if let extendedIngredJSON = convertedJsonIntoDict["extendedIngredients"] as? NSArray{
                            var j = 0

                            for _ in extendedIngredJSON
                            {
                                if let embeddedIngredJSON = extendedIngredJSON[j] as? NSDictionary{
                                    if let ingred = embeddedIngredJSON["original"] {
                                        ingreds += (ingred as! String) + "\n"
                                    }
                                }
                                j += 1
                            }

                        }

                    }

                    DispatchQueue.main.async {
                        recp.recipName = name

                        recp.recipeIngredients = ingreds + "\n" +  steps
                        recp.recipeImage = image

                        self.navigationController?.pushViewController(recp, animated: true)
                    }

                } catch let error as NSError {
                    print(error.localizedDescription)
                }

            }
        }

        dataTask.resume() //API call made!

    }
    
}

struct myRecipe{
    let recipeName: String
    
}

extension RecipeTableView : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        guard let query = searchBar.text else {
            return
        }
        recipeSearch(query: query)
    }
}
