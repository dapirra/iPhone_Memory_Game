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

    func getEmoji(_ tag : Int) -> String {
        return nodes[tag].getSymbol()
    }
}
