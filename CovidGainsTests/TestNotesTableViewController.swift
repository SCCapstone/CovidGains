//
//  TestNotesTableViewController.swift
//  CovidGainsTests
//
//  Created by CAREY, ROBERT T on 1/30/21.
//

import XCTest

class TestNotesTableViewController: XCTestCase {
    var notes = [[String:String]]()
   
    func testNotesAdded() throws {
        let note = ["title": "", "body": ""]
        notes.insert(note, at: 0)
        print(notes[0])
        XCTAssertEqual(notes[0], ["title": "", "body": ""])
    }
    


}
