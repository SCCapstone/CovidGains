//
//  ItemAttributeViewContoller.swift
//  CovidGains
//
//  Created by CAREY, ROBERT T on 12/1/20.
//

import UIKit

class ItemAttributeViewContoller: UIViewController {
    var prods = [String]()
    var pName: String = ""
    var datestr: String = ""
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    @IBOutlet weak var prodName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prodName.text = pName
        
    }
    
    
    // MARK: - Navigation
    
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     
     }
    */
    
    

}
