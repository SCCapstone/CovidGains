//
//  TestBudgetViewController.swift
//  CovidGainsTests
//
//  Created by Maitri Patel on 4/26/21.
//
import XCTest
@testable import CovidGains

import Foundation

class TestBudgetViewController: XCTestCase {
    
    func testBudgetFB() {
        let budget = BudgetViewController()
        budget.db.collection("Test").getDocuments { (querySnapshot, error) in
            if let e = error{
                print("There is issue retrieving data.\(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let docID = doc.documentID
                        XCTAssertNotEqual(docID, "")
                    }
                    
                }
            }
        }
    }
    func testInsertDeleteBudgetData() {
        let budget = BudgetViewController()
        var newBudgetData = budget.budgetData
        let newBudget = MyBudget(bProductName: "Example", bProductCost: "23")
        newBudgetData.append(newBudget)
        
        XCTAssertEqual(newBudget.bProductName, newBudgetData[newBudgetData.endIndex-1].bProductName)
        
        XCTAssertEqual(newBudget.bProductCost, newBudgetData[newBudgetData.endIndex-1].bProductCost)
        
        newBudgetData.remove(at: newBudgetData.endIndex-1)
        let temp = newBudgetData.endIndex - 1
        
        XCTAssertFalse(newBudgetData.indices.contains(temp))
    }
}
