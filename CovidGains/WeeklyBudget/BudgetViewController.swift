//
//  BudgetViewController.swift
//  CovidGains
//
//  Created by TABASSUM, NISHAT on 12/4/20.
//

import UIKit

class BudgetViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var beveragesTextField: UITextField!
    @IBOutlet weak var cannedTextField: UITextField!
    @IBOutlet weak var dairyTextField: UITextField!
    @IBOutlet weak var meatTextField: UITextField!
    @IBOutlet weak var produceTextField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBAction func totalButton(_ sender: Any) {
        
        let firstValue = Double(beveragesTextField.text!)
        let secondValue = Double(cannedTextField.text!)
        let thirdValue = Double(dairyTextField.text!)
        let fourthValue = Double(meatTextField.text!)
        let fifthValue = Double(produceTextField.text!)
        
        if firstValue != nil && secondValue != nil && thirdValue != nil && fourthValue != nil && fifthValue != nil {
        let outputValue = Double(firstValue! + secondValue! + thirdValue! + fourthValue! + fifthValue!)
        priceLabel.text = " $ \(outputValue) "
        } else {
        priceLabel.text = "Enter no."
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.beveragesTextField.delegate = self
        self.cannedTextField.delegate = self
        self.dairyTextField.delegate = self
        self.meatTextField.delegate = self
        self.produceTextField.delegate = self
        beveragesTextField.clearButtonMode = .always
        cannedTextField.clearButtonMode = .always
        dairyTextField.clearButtonMode = .always
        meatTextField.clearButtonMode = .always
        produceTextField.clearButtonMode = .always
        beveragesTextField.clearButtonMode = .whileEditing
        cannedTextField.clearButtonMode = .whileEditing
        dairyTextField.clearButtonMode = .whileEditing
        meatTextField.clearButtonMode = .whileEditing
        produceTextField.clearButtonMode = .whileEditing
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

