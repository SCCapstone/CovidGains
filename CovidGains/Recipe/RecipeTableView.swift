//
//  RecipeTableView.swift
//  CovidGains
//
//  Created by Praful Chunchu on 2/12/21.

import UIKit
import Firebase
import FirebaseStorage
import Photos
import FirebaseUI
import Foundation

class RecipeTableView: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let db = Firestore.firestore()
    var recipeData = [myRecipe]()
    let query = ""
    
    var gstr1 = ""
    var gstr2 = ""
    var gstr3 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        //expProdRecip()
    }
    
    //generates recipies using top 3 expiry product
    func expProdRecip(){
        let ingredient1 = NotificationTableViewController.pList.expiry1
        let ingredient2 =  NotificationTableViewController.pList.expiry2
        let ingredient3 = NotificationTableViewController.pList.expiry3
        
        let headers = [
            "x-rapidapi-key": "3989959899mshfeb4d8905d820ccp1dc37bjsn1049a6d50381",
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=" + ingredient1 + "%2C" + ingredient2 + "%2C" + ingredient3 + "&number=15&ranking=1&ignorePantry=true")! as URL,
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
                    if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSArray{ //converted JSON objec to dictonary
                        
                        var i = 0
                        for _ in convertedJsonIntoDict{
                            if let recipe = convertedJsonIntoDict[i] as? NSDictionary{
                                let rname = recipe["title"] as! String
                                let ID = recipe["id"] as! Int
                                let recip = myRecipe(recipeName: rname, recipeID: ID)
                                self.recipeData.append(recip)
                            }
                            i += 1
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
                
                
            }
        })
        
        dataTask.resume()
        
    }
    
    func recipeSearch(query: String) {
        recipeData = []
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        
        let headers = [
            "x-rapidapi-key": "3989959899mshfeb4d8905d820ccp1dc37bjsn1049a6d50381",
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=" + query + "&limitLicense=true")! as URL,
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
                            var ID: Int
                            for _ in searchResults {
                                if let recipe = searchResults[i] as? NSDictionary {
                                    rname = recipe["title"] as! String
                                    ID = recipe["id"] as! Int
                                    let recip = myRecipe(recipeName: rname, recipeID: ID)
                                    self.recipeData.append(recip)
                                    
                                }
                                i += 1
                            }
                            DispatchQueue.main.async{
                                self.tableView.reloadData()
                            }
                            
                        }
                        
                        
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
        
        cell.textLabel?.text = recipeData[indexPath.row].recipeName
        // Configure the cell...
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recp = self.storyboard?.instantiateViewController(identifier: "Detail") as? RecipeDetailViewController else{
            return
        }
        //self.navigationController?.pushViewController(recp, animated: true)
        
        var name = ""
        var image = ""
        var ID = 0
        var ingreds = "Ingredients:\n"
        var steps = "Instructions:\n"
        let headers = [
            "x-rapidapi-key": "3989959899mshfeb4d8905d820ccp1dc37bjsn1049a6d50381",
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/" + String(recipeData[indexPath.row].recipeID) + "/information")! as URL,cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if (error != nil && data == nil) {
                print("error" , error as Any)
            } else {
                
                do {
                    if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary { //converted JSON objec to dictonary
                        
                        name = convertedJsonIntoDict["title"] as! String
                        image = convertedJsonIntoDict["image"] as! String
                        ID = convertedJsonIntoDict["id"] as! Int
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
                        recp.recipeIngAndSteps = ingreds + "\n" +  steps
                        recp.recipeImage = image
                        recp.idNutrition = ID
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
    let recipeID: Int
    
}

extension RecipeTableView : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        guard let query = searchBar.text else {
            return
        }
        //recipeSearch(query: query)

        
        //Apple Pie = Apple%20Pie
        
        if(query.contains(" ")){
            let brokenQuery = query.split(separator: " ", omittingEmptySubsequences: false)
            let joinedQuery = brokenQuery.map(String.init).joined(separator: "%20")
            recipeSearch(query: joinedQuery)
        }else{
            recipeSearch(query: query)

        }
        
        
        
    }
}
