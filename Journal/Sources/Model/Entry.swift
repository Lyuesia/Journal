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
    let id: UUID

    
    init(id: UUID = UUID(), createdAt: Date = Date(), text: String) {
        self.text = text
        self.createdAt = createdAt
        self.id = id
    }
}

extension Entry: Identifiable {}
