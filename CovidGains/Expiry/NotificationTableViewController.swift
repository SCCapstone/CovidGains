//  NotificationTableViewController.swift
//  Created by CAREY, ROBERT T on 10/9/20.
//  Copyright © 2020 CAREY, ROBERT T. All rights reserved.

import UIKit
import UserNotifications
import Firebase

class NotificationTableViewController: UITableViewController {
    let db = Firestore.firestore()
    var productData = [MyReminder]() //stores all the reminders
    let user = Auth.auth().currentUser?.email
    var exp = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //calls to load data from firebase
        loadData()
    }
    
    func loadData(){
        
        self.db.collection((user)!).document("Expiry").collection("expiryList").getDocuments { (querySnapshot, error) in
            if let e = error{
                print("There is issue retrieving data.\(e)")
            }else{
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        let docID = doc.documentID
                        
                        let stamp = data["Date"] as? Timestamp
                        let date = stamp?.dateValue()
                        let new = MyReminder(productName: docID, productDetail: data["Quantity"] as! String, date: date! , identifier: "id_\(docID)")
                        self.productData.append(new)
                        
                        DispatchQueue.main.async {
                            self.productData.sort{$0.date < $1.date }
                            self.tableView.reloadData()
                            
                        }

                    }
                    //Sending first 3 items to recipe to generte random recipes
                    self.productData.sort{$0.date < $1.date }
                    pList.expiry1 = self.productData[0].productName
                    pList.expiry2 = self.productData[1].productName
                    pList.expiry3 = self.productData[2].productName
                     
                }
                
                
            }
        }
        
    }
    
    
    
    struct pList {
        static var expiry1 = String()
        static var expiry2 = String()
        static var expiry3 = String()
    }
    
    
    @IBAction func didTapAdd(_ sender: UIBarButtonItem) {
       
        guard let addVC = storyboard?.instantiateViewController(identifier: "add") as? AddViewController else{
            return
        }

        addVC.title = "New Reminder"
        addVC.navigationItem.largeTitleDisplayMode = .never
        addVC.completion = { productName, productDetail, date in
            DispatchQueue.main.async {
                
                self.navigationController?.popViewController(animated: true)
                let new = MyReminder(productName: productName, productDetail: productDetail, date: date, identifier: "id_\(productName )")
                self.productData.append(new)
                self.productData.sort{$0.date < $1.date }
                self.tableView.reloadData()
                
                //request
                let content = UNMutableNotificationContent()
                //content title, body and sound
                content.title = productName
                content.sound = .default
                content.body = productDetail
                //tigger with date
                let targetDate = date
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
                
                let request = UNNotificationRequest(identifier: "Some_id", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
                    if error != nil{
                        print("Gone wrong...")
                    }
                })
            }
            
            //stores the data to firebase
           
            //if not empty then save to firebase
            if self.user != nil{
                self.db.collection(self.user!).document("Expiry").collection("expiryList").document(productName).setData(["Date":date,"Quantity":productDetail]) { (error) in
                    if let e = error {
                        print("there was an issue saving data to firestore, \(e)")
                    } else {
                        print("Successfully saved data")
                    }
                }
            }
            else{
                self.db.collection(self.user!).document("Expiry").collection("expiryList").document(productName).setData(["Date":date,"Quantity":productDetail]) { (error) in
                    if let e = error {
                        print("there was an issue saving data to firestore, \(e)")
                    } else {
                        print("Successfully saved data")
                    }
                }
            }
        
        }
        navigationController?.pushViewController(addVC, animated: true)
        self.productData.sort{$0.date < $1.date }
        self.tableView.reloadData()
    }
    
 
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = productData[indexPath.row].productName
        
        let date = productData[indexPath.row].date
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, YYYY"
        cell.detailTextLabel?.text = "Expiry date: " + formatter.string(from: date)
        
        //cell.detailTextLabel?.text = formatter.string(from: date)

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let moreVC = storyboard?.instantiateViewController(identifier: "more") as? DetailViewController else{
//             return
//         }
//        moreVC.productTitle = productData[indexPath.row].productName // first line = apples
//        
//        let date = productData[indexPath.row].date
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMM dd, YYYY 'at' hh:mm:ss a"
//        moreVC.dateAddedString = formatter.string(from: date) //second line
//        
//        moreVC.productDetail = productData[indexPath.row].productDetail //third line = 5
//        navigationController?.pushViewController(moreVC, animated: true)
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // slide to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.db.collection(self.user!).document("Expiry").collection("expiryList").document(productData[indexPath.row].productName).delete()
            self.productData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }

    }


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

//hold our reminder objects
struct MyReminder{
    let productName: String //title
    let productDetail: String
    let date: Date
    let identifier: String
}



