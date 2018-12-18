//
//  ViewController.swift
//  DavidPirragliaMemoryGame
//
//  Created by David Pirraglia on 12/16/18.
//

import UIKit

class ViewController: UIViewController {

    private var game: GameModel = GameModel()
    private var last2Cards: [UIButton] = []
    private var flipLast2Cards: Bool = false
    private var allButtons: [UIButton] = []

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
        // Return if the card is already matched or if it was pressed twice
        if game.isAlreadyMatched(sender.tag) {
            return
        }

        if last2Cards.count > 0 {
            if sender.tag == last2Cards[0].tag {
                return
            }
        }

        if last2Cards.count > 1 {
            if sender.tag == last2Cards[1].tag {
                return
            }
        }

        showCard(sender, game.getEmoji(sender.tag))

        if last2Cards.count == 2 {
            if flipLast2Cards { // Flip the previous 2 cards back over
                hideCard(last2Cards[0])
                hideCard(last2Cards[1])
                flipLast2Cards = false
            }
            last2Cards = [] // Empty the list of previous cards
        } else if last2Cards.count == 1 {
            if game.isMatch(sender.tag, last2Cards[0].tag) {
                if game.isWin() { // Check for a win
                    let alert = UIAlertController(title: "You Win",
                        message: "Congratulations",
                        preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK",
                        style: UIAlertActionStyle.default, handler: {action in
                            self.reset()
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            } else { // The cards didn't match; so flip them back over later
                flipLast2Cards = true
            }

            // Adjust the moves labels
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

        if allButtons == [] {
            allButtons = [
                button0,  button1,  button2,  button3,
                button4,  button5,  button6,  button7,
                button8,  button9,  button10, button11,
                button12, button13, button14, button15,
                button16, button17, button18, button19
            ]
        }

        for button in allButtons {
            hideCard(button)
        }
    }
}

