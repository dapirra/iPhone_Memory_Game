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
    private var last2Cards: [UIButton] = []
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

    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button17: UIButton!
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!

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

        if last2Cards.count == 2 {
            if flipLast2Cards {
                hideCard(last2Cards[0])
                hideCard(last2Cards[1])
                flipLast2Cards = false
            }
            last2Cards = []
        } else if last2Cards.count == 1 {
            if game.isMatch(sender.tag, last2Cards[0].tag) {
                if game.isWin() {
                    let alert = UIAlertController(title: "You Win",
                        message: "Congratulations",
                        preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK",
                        style: UIAlertActionStyle.default, handler: {action in
                            self.reset()
                    }))
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
                        style: UIAlertActionStyle.default, handler: {action in
                            self.reset()
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }

        lastTag = sender.tag
        last2Cards.append(sender)
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

    func reset() {
        game.reset()

        lblMovesMade.text = "0"
        lblMovesLeft.text = "50"

        last2Cards = []
        lastTag = -1

        let allButtons: [UIButton] = [
            button0,  button1,  button2,  button3,
            button4,  button5,  button6,  button7,
            button8,  button9,  button10, button11,
            button12, button13, button14, button15,
            button16, button17, button18, button19
        ]

        for button in allButtons {
            hideCard(button)
        }
    }
}

