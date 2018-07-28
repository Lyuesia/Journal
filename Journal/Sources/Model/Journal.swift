//
//  Journal.swift
//  Journal
//
//  Created by Bum JunKwon on 28/07/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import Foundation

class Journal {
    
    var book = [Entry]()
    
    func createEntry(with content: String) {
        let newEntry = Entry(date: Date(), content: content)
        book.append(newEntry)
    }
    
    func editEntry(of index: Int, to content: String) {
        //code
        reorganizeBook()
    }
    
    func deleteEntry(of index: Int) {
        //code
    }
    
    func reorganizeBook() {
        
    }
}
