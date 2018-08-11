//
//  Entry.swift
//  Journal
//
//  Created by Bum JunKwon on 28/07/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import Foundation

struct Entry: Equatable, EntryType {
    var text: String
    var createdAt: Date
    let id: Int
    
    private static var idFactory = 0
    
    private static func generateId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init(createdAt: Date, text: String) {
        self.text = text
        self.createdAt = createdAt
        self.id = Entry.generateId()
    }
}

extension Entry: Identifiable {}
