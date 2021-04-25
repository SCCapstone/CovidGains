//
//  NewNoteViewController.swift
//  CovidGains
//
//  Created by Maitri Patel on 4/25/21.
//

import UIKit

class NewNoteViewController: UIViewController {

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
            completion?(text, noteField.text)
        }
    }
    
}
