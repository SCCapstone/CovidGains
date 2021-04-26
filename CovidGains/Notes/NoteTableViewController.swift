//
//  NoteTableViewController.swift
//  CovidGains
//
//  Created by Maitri Patel on 4/25/21.
//

import UIKit
import Firebase

class NoteTableViewController: UITableViewController {

    var noteArray: [(title: String, note: String)] = []
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser?.email
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadData(){
        
        self.db.collection(self.user!).document("Notes").collection("NotesList").getDocuments { (querySnapshot, error) in
            if let e = error{
                print("There is issue retrieving data.\(e)")
            }else{
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        let docID = doc.documentID
                        let context = data["Note"] as! String
                        self.noteArray.append((title: docID, note: context))
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }

                    }
                    //Sending first 3 items to recipe to generte random recipes
                    
                     
                }
                
                
            }
        }
        
    }
    
    @IBAction func newNotesButton(_ sender: UIBarButtonItem) {
        guard let newNotesVC = storyboard?.instantiateViewController(identifier: "newNotes") as? NewNoteViewController else {
            return
        }
        newNotesVC.title = "New Note"
        newNotesVC.completion = {noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.noteArray.append((title: noteTitle, note: note))
            self.tableView.reloadData()
        }
        
        navigationController?.pushViewController(newNotesVC, animated: true)
    }
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return noteArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = noteArray[indexPath.row].title
        cell.detailTextLabel?.text = noteArray[indexPath.row].note
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let noteArrays = noteArray[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "editNotes") as? EditNotesViewController else {
            return
        }
        vc.title = "Note"
        vc.noteTitle = noteArrays.title
        vc.note = noteArrays.note
        
        vc.completion = {noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.noteArray[indexPath.row] = ((title: noteTitle, note: note))
            self.tableView.reloadData()
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func logOut(_ sender: UIBarButtonItem) {
        //print("Logging out")
        let LogOut = storyboard?.instantiateViewController(identifier: "MainScreen") as? ViewController
        
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else{
            return
        }


        do {
            try Auth.auth().signOut()
            //navigationController?.popToRootViewController(animated: true)
                    sceneDelegate.window?.rootViewController = LogOut
                    UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
                    UserDefaults.standard.synchronize()

        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
}
