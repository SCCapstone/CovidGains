//
//  AddViewController.swift
//  Created by CAREY, ROBERT T on 10/9/20.
//  Copyright © 2020 CAREY, ROBERT T. All rights reserved.
//

import UIKit
import Firebase
import Foundation

class AddViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var titleField : UITextField! //product names
    @IBOutlet var bodyField : UITextField! //quantity
    @IBOutlet var datePicker : UIDatePicker! //date entered
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.productData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.productData[row].name
      }

      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        titleField.text = self.productData[row].name
      }
   
  
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    var productData = [myProduct]()
    public var completion: ((String, String, Date)-> Void)?



    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
 
        titleField.inputView = pickerView
        
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
        var staleDays = 0
        var dateComponent = DateComponents()
        
        if let titleText = titleField.text, !titleText.isEmpty, let bodyText = bodyField.text, !bodyText.isEmpty{
            
            self.db.collection("Products").getDocuments { (querySnapshot, error) in
                if let e = error{
                    print("The error is : \(e)")
                    
                }else{
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            let docID = doc.documentID
                            
                            if(docID == titleText ){
                                staleDays = data["Expiration"] as! Int
                                
                                dateComponent.day = staleDays//to testExpiration
                                print("i am date",dateComponent.day)
                                
                                
                                let targetDate = self.datePicker.date
                                
                                //to add days to the current date
                                let futureDate = Calendar.current.date(byAdding: dateComponent, to: targetDate)
                                
                                let date = targetDate
                                let formatter = DateFormatter()
                                formatter.dateFormat = "MM - dd - YYYY"
                                print("Todays date",formatter.string(from: date))
                                
                                let newDate = futureDate!
                                print("Upcoming date", formatter.string(from: newDate))
                                
                                
                                self.completion?(titleText, bodyText, futureDate!)
                            }
                            
                            
                        }
                    }
                }
            }

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


