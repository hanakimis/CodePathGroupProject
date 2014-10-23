//
//  DayViewController.swift
//  Group Project
//
//  Created by Hana Kim on 10/19/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

protocol DayViewControllerDelegate {
    func returnWithDate(returnDay:String)
}

class DayViewController: UIViewController, SACalendarDelegate {

    var day:Int32 = 1
    var month:Int32 = 1
    var year:Int32 = 2014
    var delegate: DayViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var calendar: SACalendar = SACalendar(frame: CGRectMake(0, 20, 320, 400))
        calendar.delegate = self
        view.addSubview(calendar)
    }
    
    func SA2Calendar(calendar: SACalendar!, didSelectDate day: Int32, month: Int32, year: Int32) {

        var monthString = ""
        
        switch (month) {
        case 1:
            monthString = "Jan"
        case 2:
            monthString = "Feb"
        case 3:
            monthString = "Mar"
        case 4:
            monthString = "Apr"
        case 5:
            monthString = "May"
        case 6:
            monthString = "Jun"
        case 7:
            monthString = "Jul"
        case 8:
            monthString = "Aug"
        case 9:
            monthString = "Sep"
        case 10:
            monthString = "Oct"
        case 11:
            monthString = "Nov"
        case 12:
            monthString = "Dec"
        default:
            monthString = "What?"
        }
        var dayString = "\(monthString) \(day), \(year)"
        delegate?.returnWithDate(dayString)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
