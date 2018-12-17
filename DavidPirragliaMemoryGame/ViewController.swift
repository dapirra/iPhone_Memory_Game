//
//  ViewController.swift
//  DavidPirragliaMemoryGame
//
//  Created by vagrant on 12/16/18.
//  Copyright © 2018 vagrant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        var newLabel: String
        var image: UIImage

        if let movesString = lblMovesMade.text {
            var movesMade = Int(movesString)!
            movesMade += 1
            lblMovesMade.text = String(movesMade)
        }

        if let label = sender.titleLabel!.text {
            newLabel = label
        } else {
            newLabel = ""
        }

        if newLabel == "" {
            newLabel = "Hello"
            image = UIImage()
        } else {
            newLabel = ""
            image = (UIImage(named: "card.jpg") as UIImage?)!
        }

        sender.setTitle(newLabel, for: UIControlState.normal)

        sender.setBackgroundImage(image, for: UIControlState.normal)
    }
}

