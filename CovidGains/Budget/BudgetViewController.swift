//
//  BudgetViewController.swift
//  CovidGains
//
//  Created by TABASSUM, NISHAT on 12/4/20.
//

import UIKit

class BudgetViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    
    
    @IBOutlet weak var allowanceField: UITextField!
    @IBOutlet weak var safeSpentLabel: UILabel!
    @IBOutlet weak var spentLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.allowanceField.delegate = self
        allowanceField.clearButtonMode = .always
        allowanceField.clearButtonMode = .whileEditing
    }
    
    //allowance - spent = safe to spend
    //transactions = + = adds to the list of items
    //user input
    @IBAction func allowancePressed(_ sender: Any) {
        
        // ?? = nil = 0 so default = 0
        let allowance = Double (self.allowanceField.text ?? "") ?? 0
        let tipPercent = 0.20
        
        let tipAmount = (allowance * tipPercent)
        self.safeSpentLabel.text = "$\(tipAmount)"
        
        let total = allowance + tipAmount
        self.spentLabel.text = "$\(total)"
    }
    
    @IBAction func addList(_ sender: Any) {
        
        // from tab view controller
        //get the list of items of product abd prices and add them abd sent it to label for spent
    }
    
    //Hide keyboard when user touches outside keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //return funciton in keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ViewController: UITableViewDelegate{
    
}
extension ViewController: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
}
}

struct myBudget {
    let productName = ""
    let productCost = 0
    let moneyLeftNum = 0
    let spentNum = 0
}
