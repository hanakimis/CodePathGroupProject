//
//  ContactsViewController.swift
//  Group Project
//
//  Created by Jessica Jarvis on 10/14/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onX(sender: AnyObject) {

        dismissViewControllerAnimated(true, completion: nil)

    }


    @IBAction func onTap(sender: UITapGestureRecognizer) {

        view.endEditing(true)

    }


}
