//
//  TestRegisterViewController.swift
//  CovidGainsTests
//
//  Created by Praful Chunchu on 4/26/21.
//

import XCTest
import Foundation
import Firebase
import FirebaseAuth

@testable import CovidGains

class TestRegisterViewController: XCTestCase {
    
    func testRegister()
    {
        FirebaseApp.configure()
        
        let registerVC =  RegisterViewController()
        
        let email = "1@2.com"
        let password = "12356"
        
        registerVC.registerHelper(email: email, password: password)
        XCTAssertNotNil("")
               
        }
        
        
}



