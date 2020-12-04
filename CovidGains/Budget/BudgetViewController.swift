//
//  BudgetViewController.swift
//  CovidGains
//
//  Created by Nishat tabassum  on 12/3/20.
//

import UIKit

class BudgetViewController: UIViewController {
    @IBOutlet weak var incomeText: UITextField!
    @IBOutlet weak var beverageText: UITextField!
    @IBOutlet weak var cannedText: UITextField!
    @IBOutlet weak var dairyText: UITextField!
    @IBOutlet weak var meatText: UITextField!
    @IBOutlet weak var produceText: UITextField!
    @IBOutlet weak var totalText: UITextField!
    
    
    
    @IBAction func setButton(_ sender: Any) {
        let incomeTextValue = Double(incomeText.text!)!
        
        beverageText.text = String(incomeTextValue * 0.2)
        cannedText.text = String(incomeTextValue * 0.2)
        dairyText.text = String(incomeTextValue * 0.2)
        meatText.text = String(incomeTextValue * 0.2)
        produceText.text = String(incomeTextValue * 0.2)
        
        totalText.text = String(Double(beverageText.text!)! +
        Double(cannedText.text!)! + Double(dairyText.text!)! + Double(meatText.text!)! + Double(produceText.text!)!)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
