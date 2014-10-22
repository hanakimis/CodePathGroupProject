//
//  TimeInDayViewController.swift
//  Group Project
//
//  Created by Hana Kim on 10/20/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class TimeInDayViewController: UIViewController {

    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var amPMbutton: UIButton!
    
    @IBOutlet weak var minuteSelectorView: UIView!
    @IBOutlet weak var hourSelectorView: UIView!
    
    var hours = 1
    var minutes = 0
    var isPM:Bool = true
    var minuteStart:CGFloat = 35.0
    var hourStart:CGFloat = 35.0
    var minLoc = 35.0
    var time = ""
    
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
            
            if (pointY <= 70) {
                hourLabel.text = "01"
            } else if (70 < pointY) && (pointY <= 100) {
                hourLabel.text = "02"
            } else if (100 < pointY) && (pointY <= 130) {
                hourLabel.text = "03"
            } else if (130 < pointY) && (pointY <= 160) {
                hourLabel.text = "04"
            } else if (160 < pointY) && (pointY <= 190) {
                hourLabel.text = "05"
            } else if (190 < pointY) && (pointY <= 220) {
                hourLabel.text = "06"
            } else if (220 < pointY) && (pointY <= 250) {
                hourLabel.text = "07"
            } else if (250 < pointY) && (pointY <= 280) {
                hourLabel.text = "08"
            } else if (280 < pointY) && (pointY <= 310) {
                hourLabel.text = "09"
            } else if (310 < pointY) && (pointY <= 340) {
                hourLabel.text = "10"
            } else if (340 < pointY) && (pointY <= 370) {
                hourLabel.text = "11"
            } else if (pointY >= 370) {
                hourLabel.text = "12"
            }
            
            updateTime()
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            // animate to right spot
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
            }
                
            if (pointY <= 70) {
                minuteLabel.text = "00"
            } else if (70 < pointY) && (pointY <= 100) {
                minuteLabel.text = "05"
            } else if (100 < pointY) && (pointY <= 130) {
                minuteLabel.text = "10"
            } else if (130 < pointY) && (pointY <= 160) {
                minuteLabel.text = "15"
            } else if (160 < pointY) && (pointY <= 190) {
                minuteLabel.text = "20"
            } else if (190 < pointY) && (pointY <= 220) {
                minuteLabel.text = "25"
            } else if (220 < pointY) && (pointY <= 250) {
                minuteLabel.text = "30"
            } else if (250 < pointY) && (pointY <= 280) {
                minuteLabel.text = "35"
            } else if (280 < pointY) && (pointY <= 310) {
                minuteLabel.text = "40"
            } else if (310 < pointY) && (pointY <= 340) {
                minuteLabel.text = "45"
            } else if (340 < pointY) && (pointY <= 370) {
                minuteLabel.text = "50"
            } else if (pointY >= 370) {
                minuteLabel.text = "55"
            }
            
            updateTime()
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            // animate to right spot
        }
    }
    
    @IBAction func toggleAMPM(sender: UIButton) {
        if (sender.titleLabel?.text == "PM") {
           sender.setTitle("AM", forState: UIControlState.Normal)
        } else {
            sender.setTitle("PM", forState: UIControlState.Normal)
        }
    }
    
    func updateTime() {
        //time = hourLabel.text! + minuteLabel.text! + amPMbutton.titleLabel?.text!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
