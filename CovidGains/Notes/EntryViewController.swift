import UIKit
import CoreData
import Foundation

class EntryViewController: UIViewController {

    var listItems = [NSManagedObject]()
    let fileManager = FileManager()
    
    var models : [(title: String, note: String)] = []
    
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
        //vc.noteTitle = model.title
        //vc.note = model.note
//        let completeUrl = URL(fileURLWithPath: "./docs/", models.title,".txt")
//        let completeUrlString = "./docs/"+textField.text+".txt"
//        if (fileManager.fileExist(atPath:completeUrl)) {
//          let tempUrl = URL(fileURLWithPath: "./docs/temp.txt")
//          let tempUrlString = "./docs/temp.txt"
//          fileManager.createFile(atPath: tempUrlString, contents: noteField.text)
//          fileManager.replaceItem(at: completeUrl, withItemAt: tempUrl)
//          fileManager.removeItem(at:tempUrl)
//        } else{
//          fileManager.createFile(atPath: completeUrlString, contents: noteField.text)
//        }

    }

}
