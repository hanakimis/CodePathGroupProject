//
//  ContactsViewController.swift
//  Group Project
//
//  Created by Jessica Jarvis on 10/14/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit
import AddressBookUI

class ContactsViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func readFromAddressBook(addressBook: ABAddressBookRef) {
        
        /* Get all the people in the address book */
        let allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook).takeRetainedValue() as NSArray
        for person: ABRecordRef in allPeople {
            println(person)
        }
    }
    


    @IBAction func onX(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
