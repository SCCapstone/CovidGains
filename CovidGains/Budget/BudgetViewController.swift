//
//  BudgetViewController.swift
//  CovidGains
//
//  Created by TABASSUM, NISHAT on 12/4/20.
//

import UIKit
import Firebase
class BudgetViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var allowanceField: UITextField!
    @IBOutlet weak var safeSpentLabel: UILabel!
    @IBOutlet weak var spentLabel: UILabel!
    var allowance = 0
    var spent = 0
    var safeAmount = 0
    var budgetData = [MyBudget]()
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser?.email
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        allowanceField.delegate = self
        allowanceField.clearButtonMode = .always
        allowanceField.clearButtonMode = .whileEditing
        loadB()
    }
    
    func loadB(){
        let budgUser = (user)! + " Budget"
        print(budgUser)
        self.db.collection(budgUser).getDocuments { (querySnapshot, error) in
            if let e = error{
                print("There is issue retrieving data.\(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        let docID = doc.documentID
                        
                        //let timeStamp =
                        
                        let new = MyBudget(bProductName: docID, bProductCost: data["Price"] as! String)
                        self.budgetData.append(new)
                        
                        DispatchQueue.main.async {
                                self.tableView.reloadData()
                        }
                    }
                    
                }
            }
        }
        self.db.collection((user)! + " BudgetAllow").getDocuments { (querySnapshot, error) in
            if let e = error {
                print("There is issue retrieving data. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data1 = doc.data()
                        if data1["num"] != nil {
                            self.allowance = data1["num"] as! Int
                            if data1["spent"] != nil {
                                self.spent = data1["spent"] as! Int
                            }
                            if data1["safetospend"] != nil {
                                self.safeAmount = data1["safetospend"] as! Int
                            }
                        }
                        print(self.allowance); print(self.spent); print(self.safeAmount)
                        self.safeSpentLabel.text = "$\(self.safeAmount)"
                        self.spentLabel.text = "$\(self.spent)"
                        //allowance = (data as NSString).integerValue
                    }
                }
            }
            
        }
    }
    
    
    //allowance - spent = safe to spend
    //transactions = + = adds to the list of items
    //user input
    @IBAction func allowancePressed(_ sender: Any) {
        allowance = Int (self.allowanceField.text ?? "") ?? 0
        self.safeSpentLabel.text = "$\(self.safeAmount)"
        self.spentLabel.text = "$\(self.spent)"
        print("\(allowance)")
        if self.user != nil {
            self.db.collection(self.user! + " BudgetAllow").document("Allowance").setData(["num":allowance])
        }
        // ?? = nil = 0 so default = 0

    }
    
    @IBAction func pressedAdd(){
        guard let addNewBudgetVC = storyboard?.instantiateViewController(identifier: "addNewBudget") as? AddNewBudgetViewController else{
            return
        }
            addNewBudgetVC.title = "New Budget"
            addNewBudgetVC.navigationItem.largeTitleDisplayMode = .never
            addNewBudgetVC.comp = {bProductName, bProductCost in DispatchQueue.main.async{
                self.navigationController?.popToRootViewController(animated: true)
                let newBudget = MyBudget(bProductName: bProductName, bProductCost: bProductCost)
                self.budgetData.append(newBudget)
                self.tableView.reloadData()
                
                self.spent += (newBudget.bProductCost as NSString).integerValue
                self.safeAmount = (self.allowance - self.spent)
                self.safeSpentLabel.text = "$\(self.safeAmount)"
                self.db.collection(self.user! + " BudgetAllow").document("Allowance").setData(["num":self.allowance,"spent":self.spent,"safetospend":self.safeAmount])
                self.spentLabel.text = "$\(self.spent)"
            }
            
            if self.user != nil {
                self.db.collection(self.user! + " Budget").document(bProductName).setData(["Price": bProductCost]) { (error) in
                    if let e = error {
                        print("there was an issue saving data to firestore, \(e)")
                    } else {
                        print("Successfully saved data")
                    }
                }
            }
            self.tableView.reloadData()
                
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
