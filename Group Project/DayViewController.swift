//
//  DayViewController.swift
//  Group Project
//
//  Created by Hana Kim on 10/19/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class DayViewController: UIViewController, SACalendarDelegate {

    var day = 1
    var month = 1
    var year = 2014
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var calendar: SACalendar = SACalendar(frame: CGRectMake(0, 20, 320, 400))
        calendar.delegate = self
        view.addSubview(calendar)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
