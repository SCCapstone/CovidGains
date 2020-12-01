import UIKit
import CoreData
import FileManager

class EntryViewController: UIViewController {

    var listItems = [NSManagedObject]()

    @IBOutlet weak var titleField: UITextField!

    @IBOutlet var noteField: UITextView!

    public var completion: ((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder() //showing keyboard
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButton))

//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//
//        let managedContext = appDelegate.managedObjectContext
//
//        let entiry = NSEntityDescription.entity(forEntityName: "EntryEntity", in: managedContext)
//
//        let item = NSManagedObject(entity: entiry!, insertInto: managedContext)
    }

    override func viewWillAppear(_ animated: Bool) {

        //let appDelegate = UIApplication.shared.delegate as? AppDelegate

//        let managedContext = appDelegate.managedObjectContext
//
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EntryEntity")
    }


    @objc func saveButton(){
        //only if text in it
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty{
            completion?(text, noteField.text)
        }

        let completeUrl = URL(fileURLWithPath: "./docs/"+noteField.title+".txt")
        if (FileManager.fileExist(atPath:completeUrl)) {
          let tempUrl = URL(fileURLWithPath: "./docs/temp.txt")
          FileManager.createFile(atPath: tempUrl, contents: noteField.text)
          FileManager.replaceItem(at: completeUrl, withItemAt: tempUrl)
          FileManager.rempveItem(at:tempUrl)
        } else
          FileManager.createFile(atPath: completeUrl, contents: noteField.text)

    }

}
