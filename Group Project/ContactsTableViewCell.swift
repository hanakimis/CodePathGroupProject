//
//  ContactsTableViewCell.swift
//  Group Project
//
//  Created by Jessica Jarvis on 10/20/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    //VARS
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()


    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    


}
