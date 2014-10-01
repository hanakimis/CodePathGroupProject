//
//  CreateAccountViewController.swift
//  Group Project
//
//  Created by Hana Kim on 9/30/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelCreateAccount(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
