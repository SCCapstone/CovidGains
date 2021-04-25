//
//  AddNewBudgetViewController.swift
//  CovidGains
//
//  Created by Maitri Patel on 2/27/21.
//

import UIKit

class AddNewBudgetViewController: UIViewController {

    @IBOutlet var prodName: UITextField!
    @IBOutlet var prodCost: UITextField!
    
    
    public var comp: ((String, String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(savePressed))
    }
    @objc func savePressed(){
        if let tText = prodName.text, !tText.isEmpty, let bText = prodCost.text, !bText.isEmpty && Int(prodCost.text as! String) != nil && Int(prodCost.text as! String)! > 0 {
            comp?(tText, bText)
        } else {
            let alertController:UIAlertController = UIAlertController(title: "Error", message: "Not a valid number!", preferredStyle: UIAlertController.Style.alert)
            let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
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
extension String {
    func isNumber() -> Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
