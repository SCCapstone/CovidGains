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
    
    
    @IBOutlet weak var heightSliderVal: UISlider!
    
    
    @IBOutlet weak var weightSliderVal: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    @IBAction func heightSlider(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
        
        
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
        
        
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let height = heightSliderVal.value
        let weight = weightSliderVal.value
        
        let bmi = weight / (height * height)
        
        let secondvc = SecondViewController()
        secondvc.bmiValue = String(format: "%.1f", bmi)
        
        self.present(secondvc, animated: true, completion: nil)
    }
    
    
    
}
