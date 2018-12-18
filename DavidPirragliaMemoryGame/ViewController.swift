//
//  ViewController.swift
//  DavidPirragliaMemoryGame
//
//  Created by vagrant on 12/16/18.
//  Copyright © 2018 vagrant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var game: GameModel = GameModel()
    private var lastTag: Int = -1
    private var lastButtons: [UIButton] = []
    private var flipLast2Cards: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var lblMovesLeft: UILabel!

    @IBOutlet weak var lblMovesMade: UILabel!

    @IBAction func btnClick(_ sender: UIButton) {
        var label: String = ""

        if game.isAlreadyMatched(sender.tag) || lastTag == sender.tag {
            return
        }

        if let testLabel = sender.titleLabel!.text {
            label = testLabel
        }

        if label == "" {
            showCard(sender, game.getEmoji(sender.tag))
        } else {
            hideCard(sender)
        }

        if lastButtons.count == 2 {
            if flipLast2Cards {
                hideCard(lastButtons[0])
                hideCard(lastButtons[1])
                flipLast2Cards = false
            }
            lastButtons = []
        } else if lastButtons.count == 1 {
            if game.isMatch(sender.tag, lastButtons[0].tag) {
                if game.isWin() {
                    let alert = UIAlertController(title: "You Win",
                        message: "Congratulations",
                        preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK",
                        style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                flipLast2Cards = true
            }

            if let movesMadeString = lblMovesMade.text,
                let movesLeftString = lblMovesLeft.text,
                let movesMade = Int(movesMadeString),
                let movesLeft = Int(movesLeftString) {

                lblMovesMade.text = String(movesMade + 1)
                lblMovesLeft.text = String(movesLeft - 1)

                if movesLeft == 1 { // 0 is being displayed at this point
                    let alert = UIAlertController(title: "You Lose",
                        message: "Better luck next time",
                        preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK",
                        style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }

        lastTag = sender.tag
        lastButtons.append(sender)
    }

    func showCard(_ button: UIButton, _ text: String) {
        button.setTitle(text, for: UIControlState.normal)
        button.titleLabel!.text = text
        button.setBackgroundImage(UIImage(), for: UIControlState.normal)
    }

    func hideCard(_ button: UIButton) {
        button.setTitle("", for: UIControlState.normal)
        button.titleLabel!.text = ""
        button.setBackgroundImage((UIImage(named: "card.jpg") as UIImage?)!,
            for: UIControlState.normal)
    }
}

