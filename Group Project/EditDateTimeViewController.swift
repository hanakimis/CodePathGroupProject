//
//  EditDateTimeViewController.swift
//  Group Project
//
//  Created by Hana Kim on 10/19/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

protocol EditDateTimeViewControllerDelegate {
    func returnWithDateTime(dateTime:[String:String])
}


class EditDateTimeViewController: UIViewController, TimeInDayViewControllerDelegate, DayViewControllerDelegate {

    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var dayButton: UIButton!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var selectedTabIndicator: UIImageView!
    
    var delegate: EditDateTimeViewControllerDelegate?
    var dayViewController: DayViewController!
    var timeViewController: TimeInDayViewController!
    var currentTab = 1
    
    var tabViewControllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        dayViewController  = storyboard.instantiateViewControllerWithIdentifier("DayViewController") as DayViewController
        dayViewController.delegate = self
        timeViewController = storyboard.instantiateViewControllerWithIdentifier("TimeInDayViewController") as TimeInDayViewController
        timeViewController.delegate = self
        tabViewControllers.append(dayViewController)
        tabViewControllers.append(timeViewController)
        dayButton.tag = 0
        timeButton.tag = 1
        
        selectTab(currentTab)
    }

    func returnWithTime(returnTime:String) {
        timeLabel.text = returnTime
    }
    func returnWithDate(returnDay:String) {
        dayLabel.text = returnDay
    }
    
    @IBAction func tapCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onDone(sender: AnyObject) {
        delegate?.returnWithDateTime(["date":dayLabel.text!, "time":timeLabel.text!])
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onTabButton(sender: UIButton) {
        if (currentTab != sender.tag) {
            selectTab(sender.tag)
            currentTab = sender.tag
        }
    }
    
    func selectTab(tab: Int) {
        var frame = contentView.frame
        currentTab = tab
        
        self.addChildViewController(tabViewControllers[tab])
        contentView.addSubview(tabViewControllers[tab].view)
        tabViewControllers[tab].view.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        tabViewControllers[tab].didMoveToParentViewController(self)
        
        if (tab == 1) {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.selectedTabIndicator.frame.origin.x = 174.0
                
                }) { (finished: Bool) -> Void in
 
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.selectedTabIndicator.frame.origin.x = 8.0
                
                }) { (finished: Bool) -> Void in
                    
            }
        }
    }
    
    func unselectTab(tab: Int) {
        tabViewControllers[tab].view.removeFromSuperview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
