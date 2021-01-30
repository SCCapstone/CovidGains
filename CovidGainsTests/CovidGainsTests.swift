//
//  CovidGainsTests.swift
//  CovidGainsTests
//
//  Created by CAREY, ROBERT T on 1/28/21.
//

import XCTest
@testable import CovidGains
import Firebase
class CovidGainsTests: XCTestCase {
    let db = Firestore.firestore()
    var notificationTable: NotificationTableViewController!
    
    override func setUp() {
        super.setUp()
        notificationTable = NotificationTableViewController()
    }
    override func tearDown() {
        notificationTable = nil
        super.tearDown()
    }
    func test_add_to_database() {
        self.db.collection("User").document("apple").setData(["Quantity":"2"])
            
    }

}
