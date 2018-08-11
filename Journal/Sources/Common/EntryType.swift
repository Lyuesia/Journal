//
//  EntryType.swift
//  Journal
//
//  Created by Bum JunKwon on 11/08/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import Foundation

protocol EntryType: Identifiable, Equatable {
    var createdAt: Date { get }
    var text: String { get set }
}
