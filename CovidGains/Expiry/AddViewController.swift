//
//  AddViewController.swift
//  Created by CAREY, ROBERT T on 10/9/20.
//  Copyright © 2020 CAREY, ROBERT T. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController {

    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    var productData = [myProduct]()
    
    @IBOutlet var titleField : UITextField! //product names
    @IBOutlet var bodyField : UITextField! //quantity
    @IBOutlet var datePicker : UIDatePicker! //date entered
    
    public var completion: ((String, String, Date)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleField.clearButtonMode = .always
        bodyField.clearButtonMode = .always
      

        titleField.clearButtonMode = .whileEditing
        bodyField.clearButtonMode = .whileEditing

        self.loadProductsData()
        
    }
    
    func loadProductsData()
    {
        self.db.collection("Products").getDocuments { (querySnapshot, error) in
            if let e = error{
                print("The error is : \(e)")
                
            }else{
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        let docID = doc.documentID
                        
                        let product = myProduct(name: docID, expiration: data["Expiration"] as! Int)
                        self.productData.append(product)
                        
                    }
                }
            }
        }
    }
    
    @IBAction func tappedSave(_ sender: Any) {
        if let titleText = titleField.text, !titleText.isEmpty, let bodyText = bodyField.text, !bodyText.isEmpty{
            
            let targetDate = datePicker.date
            var dateComponent = DateComponents()
            
            var i = 0
            
            for item in productData {
                if item.name == titleField.text! {
                    dateComponent.day = item.expiration
                }
                i += 1
            }
            
            //to add days to the current date
            let futureDate = Calendar.current.date(byAdding: dateComponent, to: targetDate)
            
            completion?(titleText, bodyText, futureDate!)

            }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

struct myProduct{
    let name: String
    let expiration: Int
    
}


