//
//  BudgetViewController.swift
//  CovidGains
//
//  Created by TABASSUM, NISHAT on 12/4/20.
//

import UIKit

class BudgetViewController: UIViewController {

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
    }
    

}
