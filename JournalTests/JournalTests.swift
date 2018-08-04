//
//  JournalTests.swift
//  JournalTests
//
//  Created by Bum JunKwon on 28/07/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import XCTest
@testable import Journal

class JournalTests: XCTestCase {
    
    func testEditEntryText() {
        //setup
        var entry = Entry(date: Date(), content: "aaaaa")
        //run
        entry.content = "wwwwww"
        //verify
        XCTAssertEqual(entry.content, "wwwwww")
        //teardown (상태초기화)
    }
    
    func testAddEntryToJournal() {
        let journal = InMemoryJournal()
        let newEntry = Entry(date: Date(), content: "일기")
        
        journal.add(newEntry)
        
        let entryInJournal: Entry? = journal.entry(with:1)
        
        XCTAssertEqual((entryInJournal), .some(newEntry))
        XCTAssertTrue(entryInJournal == newEntry)
        XCTAssertTrue(entryInJournal?.isIdentical(to: newEntry) == true)
    }
    
}


