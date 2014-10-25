//
//  ViewController.swift
//  Group Project
//
//  Created by Hana Kim on 9/23/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var eventOne: UIView!
    @IBOutlet weak var eventTwo: UIView!
    @IBOutlet weak var eventThree: UIView!
    @IBOutlet weak var eventFour: UIView!
    @IBOutlet weak var eventFive: UIView!





    override func viewDidLoad() {
        super.viewDidLoad()

        eventOne.layer.cornerRadius = 2.0
        eventTwo.layer.cornerRadius = 2.0
        eventThree.layer.cornerRadius = 2.0
        eventFour.layer.cornerRadius = 2.0
        eventFive.layer.cornerRadius = 2.0


        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
