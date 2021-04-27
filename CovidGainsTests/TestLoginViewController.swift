//
//  TestLoginViewController.swift
//  CovidGainsTests
//
//  Created by Maitri Patel on 4/26/21.
//

import XCTest
import Foundation
import Firebase
import FirebaseAuth

@testable import CovidGains

class TestLoginViewController: XCTestCase {
    
    func testLogIn()
    {
        FirebaseApp.configure()
        
        let loginVC =  LoginViewController()
        
        let email = "1@2.com"
        let password = "12356"
        
        loginVC.loginHelper(email: email, password: password)
        XCTAssertNotNil("")
               
        }
        
        
}
