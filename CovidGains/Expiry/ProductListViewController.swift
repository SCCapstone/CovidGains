//  ProductListViewController.swift
//  Created by CAREY, ROBERT T on 10/9/20.
//  Copyright © 2020 CAREY, ROBERT T. All rights reserved.
//

import UIKit
import Firebase

class ProductListViewController: UITableViewController {
        
    var products = [String]()
    var docIDs = [String]()
    var newProduct: String = ""
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        for items in docIDs {
            print("DOCID: ", items)
        }
        loadProds()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    
    func loadProds() {
        
        
        db.collection("Product Details").addSnapshotListener { (querySnapshot, error) in
            self.products = []
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let user = data["User"] as? String, let ProdName = data["Product Name"] as? String {
                            self.products.append(ProdName)
                            
                            DispatchQueue.main.async {
                                 self.tableView.reloadData()
                            }
                        }
                    }
                }
                /*
                var i = 0
                for items in self.products {
                    docIDs[i] = db.collection("Product Details").get
                    i += 1
                }
                */
                db.collection("Product Details").whereField("capital", isEqualTo: true)
                    .getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                                docIDs[i] = "\(document.documentID) => \(document.data())"
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
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = products[indexPath.row]
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let attribvc = storyboard?.instantiateViewController(withIdentifier: "ItemAttributeViewContoller") as? ItemAttributeViewContoller
        attribvc?.pName = products[indexPath.row]
        //print(products[indexPath.row])
        self.navigationController?.pushViewController(attribvc!, animated: true)
    }
    
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
      
    }

    @IBAction func done(segue:UIStoryboardSegue) {
        let productDetailVC = segue.source as! ProductDetailViewController
        newProduct = productDetailVC.prodStr
        
        products.append(newProduct)
        let user = Auth.auth().currentUser?.email
        ref = db.collection("Product Details").addDocument(data: ["User":user,"Product Name":newProduct, "Date":Date().timeIntervalSince1970]) { (	error) in
            if let e = error {
                print("there was an issue saving data to firestore, \(e)")
            } else {
                let docid = (self.ref!.documentID)
                self.docIDs.append(docid)
                
                print(docid)
                
                print("Successfully saved data")
            }
        }
        tableView.reloadData()
        
    }
    
    //Deleting the product by sliding left
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.products.remove(at: indexPath.row)
            db.collection("Product Details").document(docIDs[indexPath.row]).delete()
            tableView.deleteRows(at: [indexPath], with: .fade)
            docIDs.remove(at: indexPath.row)
            
        }
    }
    
    
    
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "prodDet" {
            let productDetailVC = segue.source as! ProductDetailViewController
            newProduct = productDetailVC.prodStr
            
        }
    }
    */

}
