//
//  SecondViewController.swift
//  CovidGains
//
//  Created by Praful Chunchu on 12/4/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        view.addSubview(label)
}
    
}
