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
        self.db.collection(user!).document("Budget").collection("budgetList").getDocuments { (querySnapshot, error) in
            if let e = error{
                print("There is issue retrieving data.\(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        
                        let data = doc.data()
                        
                        if ((data["name"] != nil) && data["price"] != nil) {
                         
                            let new = MyBudget(bProductName: data["name"] as! String, bProductCost: data["price"] as! String)
                            self.budgetData.append(new)
                            
                        }
                        
                        DispatchQueue.main.async {
                                self.tableView.reloadData()
                        }
                    }
                    
                }
            }
        }
        
        let docRef = db.collection(user!).document("BudgetAllow")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                if data?["allowance"] != nil {
                    self.allowance = data?["allowance"] as! Int
                    self.safeAmount = self.allowance
                    if data?["spent"] != nil {
                        self.spent = data?["spent"] as! Int
                    }
                    if data?["safetospend"] != nil {
                        self.safeAmount = data?["safetospend"] as! Int
                    }
                }
                print(self.allowance); print(self.spent); print(self.safeAmount)
                self.safeSpentLabel.text = "$\(self.safeAmount)"
                self.spentLabel.text = "$\(self.spent)"
            } else {
                print("Document does not exist")
            }
        }
    }
    
    // slide to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.db.collection(self.user!).document("Budget").collection("budgetList").document(budgetData[indexPath.row].bProductName).delete()
            self.spent -= (self.budgetData[indexPath.row].bProductCost as NSString).integerValue
            self.safeAmount = (self.allowance - self.spent)
            self.safeSpentLabel.text = "$\(self.safeAmount)"
            self.db.collection(self.user!).document("BudgetAllow").setData(["allowance":self.allowance,"spent":self.spent,"safetospend":self.safeAmount])
            self.spentLabel.text = "$\(self.spent)"
            self.budgetData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }

    }
    
    //allowance - spent = safe to spend
    //transactions = + = adds to the list of items
    //user input
    @IBAction func allowancePressed(_ sender: Any) {
        allowance = Int (self.allowanceField.text ?? "") ?? 0
        self.safeSpentLabel.text = "$\(self.allowance)"
        self.spentLabel.text = "$\(self.spent)"
        print("\(allowance)")
        if self.user != nil {
            self.db.collection(self.user!).document("BudgetAllow").setData(["allowance":allowance])
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
                let newBudget = MyBudget(bProductName: bProductName, bProductCost: "$" + bProductCost)
                self.budgetData.append(newBudget)
                self.tableView.reloadData()
                
                self.spent += (newBudget.bProductCost as NSString).integerValue
                self.safeAmount = (self.allowance - self.spent)
                self.safeSpentLabel.text = "$\(self.safeAmount)"
                self.db.collection(self.user!).document("BudgetAllow").setData(["allowance":self.allowance,"spent":self.spent,"safetospend":self.safeAmount])
                self.spentLabel.text = "$\(self.spent)"
            }
            
            if self.user != nil {
                self.db.collection(self.user!).document("Budget").collection("budgetList").document(bProductName).setData(["name": bProductName, "price": bProductCost]) { (error) in
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
