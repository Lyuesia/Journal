//
//  JournalTests.swift
//  JournalTests
//
//  Created by Bum JunKwon on 28/07/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import XCTest
//import Nimble
@testable import Journal

class JournalTests: XCTestCase {
    
    override func setUp() {
        // 계속 쓰이는 변수 선언등
    }
    
    
    func testEditEntryText() {
        //setup
        var entry = Entry(createdAt: Date(), text: "aaaaa")
        //run
        entry.text = "wwwwww"
        //verify
        XCTAssertEqual(entry.text, "wwwwww")
        //teardown (상태초기화)
    }
    
    func testAddEntryToJournal() {
        let journal = InMemoryJournal()
        let newEntry = Entry(createdAt: Date(), text: "일기")
        
        journal.add(newEntry)
        
//        let entryInJournal: Entry? = journal.entry(with:1)
        
//        XCTAssertEqual((entryInJournal), .some(newEntry))
        XCTAssertTrue(journal.book.contains(newEntry))
//        XCTAssertTrue(entryInJournal?.id == newEntry.id)
//        XCTAssertTrue(entryInJournal?.isIdentical(to: newEntry) == true)
    }
    
    func testGetEntryWithId() {
        let oldEntry = Entry(createdAt: Date(), text: "일기")
        let journal = InMemoryJournal(entries: [oldEntry])
        
        let entry = journal.book[0]
        
        XCTAssertEqual(entry, oldEntry)
        XCTAssertTrue(entry.isIdentical(to: oldEntry) == true)
    }
    
    func testUpdateEntry() {
        var oldEntry = Entry(createdAt: Date(), text: "일기")
        let journal = InMemoryJournal(entries: [oldEntry])
        
        oldEntry.text = "일기 수정"
        journal.update(oldEntry)
        
        let entry = journal.book[0]
        XCTAssertEqual(entry, oldEntry)
        XCTAssertEqual(entry.text, "일기 수정")
    }
    
    func testRemoveEntryFromJournal() {
        let testEntry = Entry(createdAt: Date(), text: "삭제")
        let journal = InMemoryJournal(entries: [testEntry])
        
        journal.remove(testEntry)
        
        XCTAssertEqual(journal.book.count, 0)
    }
    
    func testRecentEntry() {
        let dayBeforeYesterday = Entry(createdAt: Date.distantPast, text: "그저께일기")
        let yesterDay = Entry(createdAt: Date(), text: "어제일기")
        let today = Entry(createdAt: Date.distantFuture, text: "오늘일기")
        let journal = InMemoryJournal(entries: [dayBeforeYesterday, yesterDay, today])
        // Run
        let entries = journal.recentEntries(max: 3)
        // Verify
        XCTAssertEqual(entries.count, 3)
        XCTAssertEqual(entries, [today, yesterDay, dayBeforeYesterday])
    }
}


