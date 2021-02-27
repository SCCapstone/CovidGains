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
    
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productCost: UITextField!
    
    public var comp1: ((String, Int)->Void)?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedSave(_ sender: Any) {
        if let titleText = productName.text, !titleText.isEmpty, let bodyText = productCost.text, !bodyText.isEmpty{
            //comp1?(productName, productCost)

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
