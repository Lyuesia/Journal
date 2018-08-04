//
//  Identifiable.swift
//  Journal
//
//  Created by Bum JunKwon on 04/08/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import Foundation

protocol Identifiable {
    var id: Int { get }
}

extension Identifiable {
    func isIdentical(to other: Self) -> Bool {
        return true
    }
}
