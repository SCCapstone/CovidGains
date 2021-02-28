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
    var allowance = 0
    var spent = 0
    var budgetData = [MyBudget]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        allowanceField.delegate = self
        allowanceField.clearButtonMode = .always
        allowanceField.clearButtonMode = .whileEditing
        
    }
    
    //allowance - spent = safe to spend
    //transactions = + = adds to the list of items
    //user input
    @IBAction func allowancePressed(_ sender: Any) {
        allowance = Int (self.allowanceField.text ?? "") ?? 0
        // ?? = nil = 0 so default = 0

    }
    
    @IBAction func pressedAdd(){
        guard let addNewBudgetVC = storyboard?.instantiateViewController(identifier: "addNewBudget") as? AddNewBudgetViewController else{
            return
        }
        addNewBudgetVC.title = "New Budget"
        addNewBudgetVC.navigationItem.largeTitleDisplayMode = .never
        addNewBudgetVC.comp = {bProductName, bProductCost in
            DispatchQueue.main.async{
                self.navigationController?.popToRootViewController(animated: true)
                let newBudget = MyBudget(bProductName: bProductName, bProductCost: bProductCost)
                    //print(newBudget)
                self.budgetData.append(newBudget)
                //print(self.budgetData)
                self.tableView.reloadData()
                self.spent += (newBudget.bProductCost as NSString).integerValue
                //print(self.spent)
                    
                    // add all the things bProductCost
                    
                let safeAmount = (self.allowance - self.spent)
                    self.safeSpentLabel.text = "$\(safeAmount)"
                
                self.spentLabel.text = "$\(self.spent)"
                
                 
            }
        }
        navigationController?.pushViewController(addNewBudgetVC, animated: true)
        

    }

    //Hide keyboard when user touches outside keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //return function in keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}

extension BudgetViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

extension BudgetViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budgetData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBudget", for: indexPath)
        cell.textLabel?.text = budgetData[indexPath.row].bProductName
        cell.detailTextLabel?.text = budgetData[indexPath.row].bProductCost
        return cell
    }

}



extension ViewController: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
    }
}

struct MyBudget {
    let bProductName: String
    let bProductCost: String
}
