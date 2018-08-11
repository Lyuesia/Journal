//
//  EntryTests.swift
//  JournalTests
//
//  Created by Bum JunKwon on 11/08/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import XCTest
import Nimble
@testable import Journal

class EntryTests: XCTestCase {
    
    
    func testEquality() {
        let date = Date()
        let text = "dkf"
        let aEntry = Entry(createdAt: date, text: text)
        let sameEntry =  Entry(createdAt: date, text: text)
        
        expect(aEntry) != sameEntry
    }

    
}
