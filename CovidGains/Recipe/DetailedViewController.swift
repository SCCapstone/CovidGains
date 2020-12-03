//
//  DetailedViewController.swift
//  CovidGains
//
//  Created by Maitri Patel on 12/2/20.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var ingredients: UITextView!
    
    @IBOutlet weak var steps: UITextView!
    
    var name = "" 
    var ingre = ""
    var st = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = name
        ingredients.text = ingre
        steps.text = st
        
        // Do any additional setup after loading the view.
    }

}
