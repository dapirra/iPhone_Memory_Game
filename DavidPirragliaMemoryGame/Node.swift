//
//  Node.swift
//  DavidPirragliaMemoryGame
//
//  Created by David Pirraglia on 12/17/18.
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
