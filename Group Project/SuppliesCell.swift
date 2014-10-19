//
//  SuppliesCell.swift
//  Group Project
//
//  Created by Hana Kim on 10/18/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class SuppliesCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    enum SupplyType: Int {
        case Food = 1
        case Drink
        case Untencil
        case Entertainment
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
