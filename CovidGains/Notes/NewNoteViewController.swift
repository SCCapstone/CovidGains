//
//  NewNoteViewController.swift
//  CovidGains
//
//  Created by Maitri Patel on 4/25/21.
//

import UIKit
import Firebase

class NewNoteViewController: UIViewController {
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser?.email
    @IBOutlet var titleField: UITextField!
    
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String, String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButton))
    }

    @IBAction func saveButton(_ sender: Any) {
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty{
            self.db.collection(self.user!).document("Notes").collection("NotesList").document(titleField.text!).setData(["Note":noteField.text!])
            completion?(text, noteField.text)
        }
    }
    
}
