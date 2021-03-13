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
        
        //Unit test 1
        let note = ["Title": "", "Body": ""]
        notes.insert(note, at: 0)
        print(notes[0])
        XCTAssertEqual(notes[0], ["Title": "", "Body": ""])
        
        // Unit test 2
        let note2 = ["Test": "", "Value": ""]
        notes.insert(note2, at: 0)
        print(notes[0])
        XCTAssertEqual(notes[0], ["Test": "", "Value": ""])
        
        //Unit test 3
        let note3 = ["Ingredient": "", "Pepper": ""]
        notes.insert(note3, at: 0)
        print(notes[0])
        XCTAssertEqual(notes[0], ["Ingredient": "", "Pepper": ""])
    }
    
    
    


}
