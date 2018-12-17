//
//  Node.swift
//  DavidPirragliaMemoryGame
//
//  Created by vagrant on 12/17/18.
//  Copyright © 2018 vagrant. All rights reserved.
//

import Foundation

struct Node {
    private var symbol: String
    private var match: Bool

    init(_ symbol: String, _ match: Bool = false) {
        self.symbol = symbol
        self.match = match
    }

    func getSymbol() -> String {
        return symbol
    }

    func isMatch() -> Bool {
        return match
    }
}
