//
//  Tests.swift
//  Tests
//
//  Created by CAREY, ROBERT T on 1/28/21.
//
@testable import CovidGains
import Firebase
import XCTest
class Tests: XCTestCase {
    var notificationTable: NotificationTableViewController!
    
    override func setUp() {
        super.setUp()
        notificationTable = NotificationTableViewController()
    }
    override func tearDown() {
        notificationTable = nil
        super.tearDown()
    }
}
