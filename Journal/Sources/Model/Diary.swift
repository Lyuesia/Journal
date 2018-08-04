//
//  Journal.swift
//  Journal
//
//  Created by Bum JunKwon on 28/07/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import Foundation

class Diary {
    
    var book = [Entry]()
    
    func add(content: String) {
        let newEntry = Entry(date: Date(), content: content)
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
}
