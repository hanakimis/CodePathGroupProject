//
//  DetailEventViewController.swift
//  Group Project
//
//  Created by Ida Leung on 10/25/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class DetailEventViewController: UIViewController {

    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var headerUIView: UIView!
    
    
        //@IBOutlet weak var headerUIView: UIView!
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

        //    @IBOutlet weak var eventName: UILabel!
        //    @IBOutlet weak var addressLabel: UILabel!
        //    @IBOutlet weak var timeLabel: UILabel!
        //    @IBOutlet weak var dateLabel: UILabel!
        
        var detailEvent: Dictionary<String, String>!
        
        var guests: [Int]!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            headerUIView.backgroundColor = UIColor(white: 1, alpha: 0.9)
            headerUIView.hidden = true
            
            self.title = detailEvent["event"]
            eventName.text = detailEvent["event"]
            addressLabel.text = detailEvent["address"]
            timeLabel.text = detailEvent["time"]
            dateLabel.text = detailEvent["detail-date"]
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
}