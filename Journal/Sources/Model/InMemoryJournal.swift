//
//  Journal.swift
//  Journal
//
//  Created by Bum JunKwon on 28/07/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import Foundation

class InMemoryJournal: Journal {

    var book = [Entry]()
    
    func add(_ newEntry: Entry) {
        book.append(newEntry)
    }
    
    func update(index: Int, to content: String) {
        //code
    }
    
    func remove(index: Int) {
        //code
    }
    
    func entry(with id: Int) -> Entry? {
        return book[id]
    }
    
    func update(_ updatedEntry: Entry) {
        if let indexOfTargetEntry = book.index(where: {$0.id == updatedEntry.id}) {
            book[indexOfTargetEntry] = updatedEntry
        }
    }
    
    func remove(_ entry: Entry) {
        if let indexOfTargetEntry = book.index(where: {$0.id == entry.id}) {
            book.remove(at: indexOfTargetEntry)
        }
    }
    
    func recentEntries(max numberOfEntries: Int) -> [Entry]? {
        if numberOfEntries < 0 {
            return nil
        }
        let sortedBook = book.sorted { $0.createdAt > $1.createdAt }
            .prefix(numberOfEntries)
        
        return Array(sortedBook)
    }
    
    init(entries: [Entry] = []) { // = 이후는 아무 값도 안넣엇을 경우의 디폴트값
        book = entries
    }
    
}
