//
//  Entry.swift
//  Journal
//
//  Created by Bum JunKwon on 28/07/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import Foundation

class Entry {
    var content: String
    var writtenDate: Date
    var id: Int
    
    static var idFactory = 0
    
    static func generateId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init(date: Date, content: String) {
        self.content = content
        writtenDate = date
        self.id = Entry.generateId()
    }
}
