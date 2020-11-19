import UIKit

class EntryViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder() //showing keyboard
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButton))
    }
    @objc func saveButton(){
        //only if text in it
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty{
            completion?(text, noteField.text)
        }
        
    }
    
}
