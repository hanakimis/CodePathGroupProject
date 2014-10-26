//
//  TimeInDayViewController.swift
//  Group Project
//
//  Created by Hana Kim on 10/20/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

protocol TimeInDayViewControllerDelegate {
    func returnWithTime(returnTime:String)
}

class TimeInDayViewController: UIViewController {

    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var amPMbutton: UIButton!
    
    @IBOutlet weak var minuteSelectorView: UIView!
    @IBOutlet weak var hourSelectorView: UIView!
    
    var hours = "08"
    var minutes = "00"
    var amPM = "PM"
    var isPM:Bool = true
    var minuteStart:CGFloat = 35.0
    var hourStart:CGFloat = 35.0
    var minLoc = 35.0
    var time = ""
    var delegate: TimeInDayViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func panHours(panGestureRecognizer: UIPanGestureRecognizer) {
        var point = panGestureRecognizer.locationInView(view)
        var translation = panGestureRecognizer.translationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            hourStart = hourSelectorView.frame.origin.y
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            var pointY = point.y
            
           
            
            if (pointY >= 40) && (pointY <= 370) {
                hourSelectorView.frame.origin.y = point.y
            }            
            
            if (pointY <= 52) {
                hourLabel.text = "01"
            } else if (52 < pointY) && (pointY <= 82) {
                hourLabel.text = "02"
            } else if (82 < pointY) && (pointY <= 112) {
                hourLabel.text = "03"
            } else if (112 < pointY) && (pointY <= 142) {
                hourLabel.text = "04"
            } else if (142 < pointY) && (pointY <= 172) {
                hourLabel.text = "05"
            } else if (172 < pointY) && (pointY <= 202) {
                hourLabel.text = "06"
            } else if (202 < pointY) && (pointY <= 232) {
                hourLabel.text = "07"
            } else if (232 < pointY) && (pointY <= 262) {
                hourLabel.text = "08"
            } else if (262 < pointY) && (pointY <= 292) {
                hourLabel.text = "09"
            } else if (292 < pointY) && (pointY <= 322) {
                hourLabel.text = "10"
            } else if (322 < pointY) && (pointY <= 352) {
                hourLabel.text = "11"
            } else if (pointY >= 352) {
                hourLabel.text = "12"
            }
            
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            // animate to right spot
            hours = hourLabel.text!

            updateTime()
        }
    }
    
    @IBAction func panMinutes(panGestureRecognizer: UIPanGestureRecognizer) {
        var point = panGestureRecognizer.locationInView(view)
        var translation = panGestureRecognizer.translationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            minuteStart = minuteSelectorView.frame.origin.y
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
        
            var pointY = point.y
            
            if (pointY >= 40) && (pointY <= 370) {
                minuteSelectorView.frame.origin.y = point.y
                
                 println("\(pointY)")
            }
                
            if (pointY <= 52) {
                minuteLabel.text = "00"
            } else if (52 < pointY) && (pointY <= 82) {
                minuteLabel.text = "05"
            } else if (82 < pointY) && (pointY <= 112) {
                minuteLabel.text = "10"
            } else if (112 < pointY) && (pointY <= 142) {
                minuteLabel.text = "15"
            } else if (142 < pointY) && (pointY <= 172) {
                minuteLabel.text = "20"
            } else if (172 < pointY) && (pointY <= 202) {
                minuteLabel.text = "25"
            } else if (202 < pointY) && (pointY <= 232) {
                minuteLabel.text = "30"
            } else if (232 < pointY) && (pointY <= 262) {
                minuteLabel.text = "35"
            } else if (262 < pointY) && (pointY <= 292) {
                minuteLabel.text = "40"
            } else if (292 < pointY) && (pointY <= 322) {
                minuteLabel.text = "45"
            } else if (322 < pointY) && (pointY <= 352) {
                minuteLabel.text = "50"
            } else if (pointY >= 352) {
                minuteLabel.text = "55"
            }
            
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            // animate to right spot
            minutes = minuteLabel.text!
            updateTime()
        }
    }
    
    @IBAction func toggleAMPM(sender: UIButton) {
        if (sender.titleLabel?.text == "PM") {
           sender.setTitle("AM", forState: UIControlState.Normal)
            amPM = "AM"
        } else {
            sender.setTitle("PM", forState: UIControlState.Normal)
            amPM = "PM"
        }
       
        
    }
    
    func updateTime() {
        time = "\(hours) : \(minutes) \(amPM)"
        delegate?.returnWithTime(time)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
