//  EditNoteViewController.swift
//  CovidGains
//  Created by Maitri Patel on 11/19/20

import UIKit
import Firebase


protocol EditNoteDelegate {
    func updateNote(updatedTitle: String, updateBody: String)
}

class EditNoteViewController: UIViewController, UITextViewDelegate {



    @IBOutlet weak var bodyTextView: UITextView!
    
    var noteBody: String!
    var editeNoteDelegate: EditNoteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bodyTextView.delegate = self
        self.bodyTextView.text = noteBody
        self.bodyTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    
    
    func getNotedTitle() -> String {
        let components = self.bodyTextView.text.components(separatedBy: "\n")
        for component in components{
            if component.trimmingCharacters(in: CharacterSet.whitespaces).count > 0{
                return component
            }
        }
        return self.navigationItem.title ?? ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.editeNoteDelegate != nil {
            self.editeNoteDelegate?.updateNote(updatedTitle: self.getNotedTitle(), updateBody: self.bodyTextView.text)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
