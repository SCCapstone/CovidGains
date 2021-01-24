//
//  DetailViewController.swift
//  Created by CAREY, ROBERT T on 10/9/20.
//  Copyright © 2020 CAREY, ROBERT T. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var productTitle = ""
    var productDetail = ""
    var dateAddedString = ""

    @IBOutlet weak var titelLabel: UILabel!
    
    @IBOutlet weak var dateAddedLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titelLabel.text = productTitle
        dateAddedLabel.text = dateAddedString
        detailLabel.text = productDetail
        
    }

}
