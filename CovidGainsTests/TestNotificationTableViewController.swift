//
//  TestNotificationTableViewController.swift
//  CovidGainsTests
//
//  Created by CAREY, ROBERT T on 1/30/21.
//

import XCTest
import CovidGains
import Firebase
class TestNotificationTableViewController: XCTestCase {
   
    
    func testDatabaseAdd() throws {
        let db = Firestore.firestore()
        db.collection("Test").document("doc").setData(["Quantity":"1"])
        db.collection("Test").getDocuments { (querySnapshot, error) in
            if let e = error {
                print("There is issue retrieving data. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let teststr = doc.documentID
                        XCTAssertEqual("doc", "fail")
                        
                    }
                }
                
            }
        }
    
    }

   

}
