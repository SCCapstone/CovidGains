//
//  AddViewController.swift
//  Created by CAREY, ROBERT T on 10/9/20.
//  Copyright © 2020 CAREY, ROBERT T. All rights reserved.
//

import UIKit
import Firebase
import Foundation
import DropDown

class AddViewController: UIViewController, UISearchBarDelegate{
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    var productData = [myProduct]()
    var productDataNames = [String]()
    public var completion: ((String, String, Date)-> Void)?

    @IBOutlet var bodyField : UITextField! //quantity
    @IBOutlet var datePicker : UIDatePicker! //date entered
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dataFiltered: [String] = []
    var dropButton = DropDown()
    
    
    /*let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    var productData = [myProduct]()
    public var completion: ((String, String, Date)-> Void)?*/



    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadProductsData()
    
        searchBar.delegate = self
        
        dataFiltered = productDataNames

        dropButton.anchorView = searchBar
        dropButton.bottomOffset = CGPoint(x: 0, y:(dropButton.anchorView?.plainView.bounds.height)!)
        dropButton.backgroundColor = .white
        dropButton.direction = .bottom

        dropButton.selectionAction = { [unowned self] (index: Int, item: String) in
            searchBar.text = item
            print("Selected item: \(item) at index: \(index)") //Selected item: code at index: 0
        }

        bodyField.clearButtonMode = .always
        bodyField.clearButtonMode = .whileEditing

    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataFiltered = searchText.isEmpty ? productDataNames : productDataNames.filter({ (dat) -> Bool in
            dat.range(of: searchText, options: .caseInsensitive) != nil
        })

        dropButton.dataSource = dataFiltered
        dropButton.show()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        for ob: UIView in ((searchBar.subviews[0] )).subviews {
            if let z = ob as? UIButton {
                let btn: UIButton = z
                btn.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        dataFiltered = productDataNames
        dropButton.hide()
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
                        self.productDataNames.append(docID)
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
        
        if let titleText = searchBar.text, !titleText.isEmpty, let bodyText = bodyField.text, !bodyText.isEmpty{
            
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
                                //print("i am date",dateComponent.day)
                                
                                
                                let targetDate = self.datePicker.date
                                
                                //to add days to the current date
//                                let futureDate = Calendar.current.date(byAdding: dateComponent, to: targetDate)
                                
//                                let date = targetDate
//                                let formatter = DateFormatter()
//                                formatter.dateFormat = "MM - dd - YYYY"
                                //print("Todays date",formatter.string(from: date))
                                
//                                let newDate = futureDate!
                                //print("Upcoming date", formatter.string(from: newDate))
                                
                                
                                self.completion?(titleText, bodyText, targetDate)
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


