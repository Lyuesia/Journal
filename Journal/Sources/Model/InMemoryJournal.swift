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
        reorganizeBook()
    }
    
    func remove(index: Int) {
        //code
    }
    
    func reorganizeBook() {
        
    }
    
    func entry(with id: Int) -> Entry? {
        return book[id]
    }
    
    func update(_ entry: Entry) {
        
    }
    
    func remove(_ entry: Entry) {
        
    }
    
}
