//
//  TimeInDayViewController.swift
//  Group Project
//
//  Created by Hana Kim on 10/20/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class TimeInDayViewController: UIViewController {

    @IBOutlet weak var amPMbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func panMinutes(panGestureRecognizer: UIPanGestureRecognizer) {
        var point = panGestureRecognizer.locationInView(view)
        var translation = panGestureRecognizer.translationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            println("Gesture began at: \(point)")
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            println("Gesture changed at: \(point)")
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            println("Gesture ended at: \(point)")
        }
        
        
    }
    
    func updateMinutes(minutes: Int) {
        
    }
    
    func updateHours(hours: Int) {
        
    }
    
    
    @IBAction func toggleAMPM(sender: UIButton) {
        if (sender.titleLabel?.text == "PM") {
           sender.setTitle("AM", forState: UIControlState.Normal)
        } else {
            sender.setTitle("PM", forState: UIControlState.Normal)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
