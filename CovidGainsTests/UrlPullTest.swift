//
//  UrlPullTest.swift
//  CovidGainsTests
//
//  Created by Praful Chunchu on 4/26/21.
//

import XCTest
@testable import CovidGains
class UrlPullTest: XCTestCase {

    func testURLData() {
        
        let exp = expectation(description: "Download URL data")
        
        //Test any url
        let url = URL(string: "https://apple.com")!
        
        URLSession.shared.dataTask(with: url) { data, _,_ in
        
            XCTAssertNotNil(data, "No URL data was downloaded/pulled")
        exp.fulfill()
        }.resume()
        
        wait(for: [exp], timeout: 10.0)
    }
}
