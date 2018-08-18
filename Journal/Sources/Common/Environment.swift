//
//  Environment.swift
//  Journal
//
//  Created by Bum JunKwon on 18/08/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import Foundation

class Environment {
    let entryRepository: EntryRepository
    
    init(entryRepository: EntryRepository = InMemoryRepository()) {
        self.entryRepository = entryRepository
    }
}
