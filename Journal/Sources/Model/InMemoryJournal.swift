//
//  Journal.swift
//  Journal
//
//  Created by Bum JunKwon on 28/07/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import Foundation

class InMemoryJournal: Journal {
    
    var book = [UUID: Entry]()
    
    func remove(_ entry: Entry) {
        book[entry.id] = nil
    }
    
    func entry(with id: UUID) -> Entry? {
        return book[id]
    }
    
    func add(_ newEntry: Entry) {
        book[newEntry.id] = newEntry
    }
    
    func update(index: Int, to content: String) {
        //code
    }
    
    func remove(index: Int) {
        //code
    }
    
    
    func update(_ updatedEntry: Entry) {
        book[updatedEntry.id] = updatedEntry
    }
    
    
    
    func recentEntries(max numberOfEntries: Int) -> [Entry]? {
        let result = self.book
            .values
            .sorted { $0.createdAt > $1.createdAt  }
            .prefix(numberOfEntries)
        
        return Array(result)
    }
    
    init(entries: [Entry] = []) {
        var result: [UUID: Entry] = [:]
        
        entries.forEach { entry in
            result[entry.id] = entry
        }
        
        self.book = result
    }
}
