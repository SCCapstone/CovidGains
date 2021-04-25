//
//  EditNotesViewController.swift
//  CovidGains
//
//  Created by Maitri Patel on 4/25/21.
//

import UIKit

class EditNotesViewController: UIViewController {
  
//    @IBOutlet var titleLabel: UITextView!
//
//    @IBOutlet var noteLabel: UITextView!
//
    @IBOutlet var titleLabel: UITextField!
    
    @IBOutlet var noteLabel: UITextView!
    
    public var completion: ((String, String) -> Void)?

    
    public var noteTitle: String = ""
    public var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = noteTitle
        noteLabel.text = note
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButton))


        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let text = titleLabel.text, !text.isEmpty, !noteLabel.text.isEmpty{
            completion?(text, noteLabel.text)
        }
    }

}
