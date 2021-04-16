//  NotesTableViewController.swift
//  CovidGains
//  Created by Maitri Patel on 12/2/20.
//

import UIKit
import Firebase

class NotesTableViewController: UITableViewController, EditNoteDelegate {
    
    var notes = [[String:String]]()
    var selectedIndex = -1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.readNotes()
    }

    
    
    
    @IBAction func addNotesButtonTapped(_ sender: UIBarButtonItem) {
        let note = ["title": "", "body": ""]
        notes.insert(note, at: 0)
        self.tableView.reloadData()
        self.selectedIndex = 0
        performSegue(withIdentifier: "ShowEditScreenSegue", sender: nil)
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)

        cell.textLabel?.text = self.notes[indexPath.row]["title"]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        performSegue(withIdentifier: "ShowEditScreenSegue", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //EditNoteViewController
        let destinationVc = segue.destination as? EditNoteViewController
        destinationVc?.navigationItem.title = self.notes[selectedIndex]["title"]
        destinationVc?.noteBody = self.notes[selectedIndex]["body"]
        destinationVc?.editeNoteDelegate = self
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func updateNote(updatedTitle: String, updateBody: String) {
        self.notes[selectedIndex]["title"] = updatedTitle
        self.notes[selectedIndex]["body"] = updateBody
        self.tableView.reloadData()
        self.saveNotes()
    }
    
    func saveNotes() {
        UserDefaults.standard.set(self.notes, forKey: "notes")
        UserDefaults.standard.synchronize()
            
    }
    
    func readNotes() {
        if let newNotes = UserDefaults.standard.array(forKey: "notes") as? [[String:String]]{
            self.notes = newNotes
            
        }
    }
    
    
    //Deleting the product by sliding left
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        notes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        saveNotes()
    }
    

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
