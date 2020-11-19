//
//  NotesTabHome.swift
//  CovidGains
//
//  Created by Maitri Patel on 11/18/20.
//

import UIKit

class NotesTabHome: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var table: UITableView!

    var models : [(title: String, note: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func newNotesButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else{
            return
        }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = {noteTitle, note in
            self.models.append((title: noteTitle, note: note))
            self.navigationController?.popToRootViewController(animated: true)
            self.table.reloadData()
            self.label.isHidden = true
            self.table.isHidden = false
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model  = models[indexPath.row]
        
        
        //note controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note")as? NoteViewController else{
            return
            
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Note"
        vc.noteTitle = model.title
        vc.note = model.note
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
