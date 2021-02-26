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

class RecipeTableView: UITableViewController {
    
    let db = Firestore.firestore()
    var recipeData = [myRecipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRecipeData()
        self.db.collection("Recipes").document("Pizza").delete()
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
        guard let recp = storyboard?.instantiateViewController(identifier: "Detail") as? RecipeDetailViewController else{
             return
         }
        

        
        
        
        
        
        
        recp.recipName = recipeData[indexPath.row].recipeName // first line = apples
        recp.recipeIngredients = recipeData[indexPath.row].ingredients
        recp.recipeDetails = recipeData[indexPath.row].directions
        //cell.detailTextLabel?.text = formatter.string(from: date)
        
        //third line = 5
        navigationController?.pushViewController(recp, animated: true)
    }
    
    //Recipe view button function, and will be done
    
    
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct myRecipe{
    let recipeName: String
    let directions: String
    let ingredients: String
    let identifier: String
    
}

 
