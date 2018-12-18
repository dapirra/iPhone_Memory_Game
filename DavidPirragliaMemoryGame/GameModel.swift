//
//  GameModel.swift
//  DavidPirragliaMemoryGame
//
//  Created by David Pirraglia on 12/17/18.
//

import Foundation

class GameModel {
    private var defaultNodes : [Node] = []
    private var nodes: [Node] = []

    init() {
        reset()
    }

    func reset() {
        nodes = []
        defaultNodes =
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
        shuffle()
    }

    // Use the Fisher-Yates Algorithm to shuffle the nodes
    func shuffle() {
        for _ in defaultNodes {
            let rand = Int(arc4random_uniform(UInt32(defaultNodes.count)))
            nodes.append(defaultNodes[rand])
            defaultNodes.remove(at: rand)
        }
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
