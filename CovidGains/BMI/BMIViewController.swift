//
//  BMIViewController.swift
//  CovidGains
//
//  Created by Praful Chunchu on 12/4/20.
//

import UIKit

class BMIViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    

    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0f", sender.value)
    }
    
    
}
