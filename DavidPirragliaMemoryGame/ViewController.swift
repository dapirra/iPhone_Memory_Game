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
    }
}

