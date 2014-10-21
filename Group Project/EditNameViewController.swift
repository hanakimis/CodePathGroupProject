//
//  EditNameViewController.swift
//  Group Project
//
//  Created by Hana Kim on 10/18/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

protocol EditNameViewControllerDelegate {
    func returnWithName(name:String)
}

class EditNameViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!

    var delegate: EditNameViewControllerDelegate?
    var nameValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = nameValue
    }
    
    override func viewDidAppear(animated: Bool) {
        nameTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func doneEditing(sender: AnyObject) {
        delegate?.returnWithName(nameTextField.text)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func tapCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
