//
//  SettingsViewController.swift
//  Group Project
//
//  Created by Jessica Jarvis on 10/14/14.

//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!

    @IBOutlet weak var initialsImage: UIImageView!

    @IBOutlet weak var removePhotoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImage.hidden = false
        initialsImage.hidden = true


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


    @IBAction func onTap(sender: UITapGestureRecognizer) {

        view.endEditing(true)

    }

    @IBAction func onRemoveImage(sender: AnyObject) {

        avatarImage.hidden = true
        initialsImage.hidden = false
        removePhotoButton.enabled = false


    }

}
