//
//  NewItemViewController.swift
//  CovidGains
//
//  Created by CAREY, ROBERT T on 2/27/21.
//

import UIKit
import Firebase

class NewItemViewController: UIViewController {
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    @IBOutlet weak var prodName: UITextField!
    @IBOutlet weak var prodCost: UITextField!
    
    public var comp: ((String, String)->Void)?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(pressedDone))
        // Do any additional setup after loading the view.
    }
    
    @objc func pressedDone(){
        if let tText = prodName.text, !tText.isEmpty, let bText = prodCost.text, !bText.isEmpty{
            comp?(tText, bText)
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
