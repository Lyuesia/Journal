//
//  Journal.swift
//  Journal
//
//  Created by Bum JunKwon on 30/07/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import Foundation

protocol EntryRepository {
    func add(_ entry: Entry)
    func update(_ entry: Entry)
    func remove(_ entry: Entry)
    func entry(with id: UUID) -> Entry?
}

