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
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var location: UITextField!
    
    let datePicker = UIDatePicker()
    
    
    public var comp: ((String, String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(savePressed))
    }
    
    func createDatePicker(){
        time.textAlignment = .center
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target:nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        time.inputAccessoryView = toolbar
        time.inputView = datePicker
        
        datePicker.datePickerMode = .time
        
    }
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        time.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
         
        
    }
    @objc func savePressed(){
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
