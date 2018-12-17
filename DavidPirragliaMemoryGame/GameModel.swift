//
//  GameModel.swift
//  DavidPirragliaMemoryGame
//
//  Created by vagrant on 12/17/18.
//  Copyright © 2018 vagrant. All rights reserved.
//

import Foundation

class GameModel {
    private var nodes : [Node] =
        [Node("😀"), Node("😀"),
        Node("😡"), Node("😡"),
        Node("😈"), Node("😈"),
        Node("🤢"), Node("🤢"),
        Node("😎"), Node("😎"),
        Node("👽"), Node("👽"),
        Node("👍"), Node("👍"),
        Node("🙃"), Node("🙃"),
        Node("😰"), Node("😰"),
        Node("💩"), Node("💩")]

    init() {
        //
    }

    func reset() {
    }

    func getEmoji(_ tag: Int) -> String {
        return nodes[tag].getSymbol()
    }

    func isAlreadyMatched(_ tag: Int) -> Bool {
        return nodes[tag].isMatch()
    }

    func isMatch(_ tag1: Int, _ tag2: Int) -> Bool {
        if tag1 != tag2 && nodes[tag1].getSymbol() == nodes[tag2].getSymbol() {
            nodes[tag1] = Node(nodes[tag1].getSymbol(), true)
            nodes[tag2] = Node(nodes[tag2].getSymbol(), true)
            return true
        }
        return false
    }

    func isWin() -> Bool {
        for i in nodes {
            if !i.isMatch() {
                return false
            }
        }
        return true
    }
}
