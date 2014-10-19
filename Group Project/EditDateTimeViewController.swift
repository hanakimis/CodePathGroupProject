//
//  EditDateTimeViewController.swift
//  Group Project
//
//  Created by Hana Kim on 10/19/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class EditDateTimeViewController: UIViewController {

    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var dayButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dayButton.tag = 0
        timeButton.tag = 1
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tapCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    @IBAction func onTabButton(sender: UIButton) {
        var selectedTab = sender.tag
        
        
    }
    

}
