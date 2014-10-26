//
//  CreateEventViewController.swift
//  Group Project
//
//  Created by Hana Kim on 9/30/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning, EditNameViewControllerDelegate, EditLocationViewControllerDelegate,
    EditDateTimeViewControllerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameUIView: UIView!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationTitleLabel: UILabel!
    @IBOutlet weak var locationUIView: UIView!
    
    @IBOutlet weak var dateTimeUIView: UIView!
    @IBOutlet weak var dayTitleLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var guestsUIView: UIView!
    @IBOutlet weak var addGuestsButton: UIButton!
    @IBOutlet weak var invitedView: UIView!
    
    var isPresenting: Bool = true
    var editingView: UIView!
    var editingFrame = 0
    var showInvitedView = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()


        println("view did load")


    }

    override func viewDidAppear(animated: Bool) {


        if showInvitedView > 0 {

            invitedView.hidden = false

        } else {

            invitedView.hidden = true

        }

        println("view did appear")

    }
    
    
    @IBAction func onTapForEdit(sender: AnyObject) {
        performSegueWithIdentifier("addNameSegue", sender: self)
    }
    

    @IBAction func onTapBackButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func returnWithName(name:String) {
        nameLabel.text = name
    }
    
    func returnWithLocation(location:String) {
        locationLabel.text = location
    }
    
    func returnWithDateTime(dateTime:[String:String]) {
        dayLabel.text = dateTime["date"]
        timeLabel.text = dateTime["time"]
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        switch segue.identifier {
        case "addNameSegue":
            var destinationViewController = segue.destinationViewController as EditNameViewController
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationViewController.transitioningDelegate = self
            destinationViewController.delegate = self
            
            if (nameLabel.text != "Enter event name") {
                destinationViewController.nameValue = nameLabel.text!
            }
            
            editingFrame = 1
            editingView = nameUIView
            
        case "addLocationSegue":
            var destinationViewController = segue.destinationViewController as EditLocationViewController
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationViewController.transitioningDelegate = self
            destinationViewController.delegate = self

            editingFrame = 2
            editingView = locationUIView
        case "addDateTimeSegue":
            var destinationViewController = segue.destinationViewController as EditDateTimeViewController
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationViewController.transitioningDelegate = self
            destinationViewController.delegate = self
            
            var tapGesture = sender as UITapGestureRecognizer
            var point = tapGesture.locationInView(view)
            
            if (point.x < 153.0) {
                destinationViewController.currentTab = 0
            } else {
                destinationViewController.currentTab = 1
            }
            
            editingFrame = 3
            editingView = dateTimeUIView


        default:
            println("I... am not ready for this segue: \(segue.identifier)")
        }
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            var window = UIApplication.sharedApplication().keyWindow
            
            var thisFrame = window.convertRect(editingView.frame, fromView: scrollView)
            var copyUIView = UIView(frame: thisFrame)
            
            copyUIView.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
            
            if (editingFrame == 1) {
                var nameTitleLabelCopy = UILabel(frame: nameTitleLabel.frame)
                nameTitleLabelCopy.text = "Name"
                nameTitleLabelCopy.textColor = UIColor(red: 50/255, green: 82/255, blue: 110/255, alpha: 1.0)
                nameTitleLabelCopy.font = UIFont.systemFontOfSize(10.0)
                
                var nameLabelCopy = UILabel(frame: nameLabel.frame)
                nameLabelCopy.text = nameLabel.text
                nameLabelCopy.font = nameLabel.font
                nameLabelCopy.textColor = UIColor(white: 0.4, alpha: 1.0)
                
                copyUIView.addSubview(nameTitleLabelCopy)
                copyUIView.addSubview(nameLabelCopy)
                
            } else if (editingFrame == 2) {
                var locationTitleLabelCopy = UILabel(frame: locationTitleLabel.frame)
                locationTitleLabelCopy.text = "Location"
                locationTitleLabelCopy.textColor = UIColor(red: 50/255, green: 82/255, blue: 110/255, alpha: 1.0)
                locationTitleLabelCopy.font = UIFont.systemFontOfSize(10.0)
                
                var locationLabelCopy = UILabel(frame: locationLabel.frame)
                locationLabelCopy.text = locationLabel.text
                locationLabelCopy.font = locationLabel.font
                locationLabelCopy.textColor = UIColor(white: 0.4, alpha: 1.0)

                copyUIView.addSubview(locationTitleLabelCopy)
                copyUIView.addSubview(locationLabelCopy)
                
            } else if (editingFrame == 3) {
                var dayTitleLabelCopy = UILabel(frame: dayTitleLabel.frame)
                dayTitleLabelCopy.text = "Date"
                dayTitleLabelCopy.textColor = dayTitleLabel.textColor
                dayTitleLabelCopy.font = dayTitleLabel.font
                
                var dayLabelCopy = UILabel(frame: dayLabel.frame)
                dayLabelCopy.text = dayLabel.text
                dayLabelCopy.textColor = dayLabel.textColor
                dayLabelCopy.font = dayLabel.font
                
                var timeTitleLabelCopy = UILabel(frame: timeTitleLabel.frame)
                timeTitleLabelCopy.text = "Time"
                timeTitleLabelCopy.textColor = timeTitleLabel.textColor
                timeTitleLabelCopy.font = timeTitleLabel.font
                
                var timeLabelCopy = UILabel(frame: timeLabel.frame)
                timeLabelCopy.text = timeLabel.text
                timeLabelCopy.textColor = timeLabel.textColor
                timeLabelCopy.font = timeLabel.font
                
                copyUIView.addSubview(dayLabelCopy)
                copyUIView.addSubview(dayTitleLabelCopy)
                copyUIView.addSubview(timeLabelCopy)
                copyUIView.addSubview(timeTitleLabelCopy)
            }
            
            window.addSubview(copyUIView)
            window.backgroundColor = UIColor(white: 0.0, alpha: 1)
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            fromViewController.view.alpha = 0.9
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                copyUIView.frame.size.width = 320
                copyUIView.frame.size.height = 62
                copyUIView.frame.origin = CGPoint(x: 0, y: 56)
                }) { (finished: Bool) -> Void in
                    toViewController.view.alpha = 1
                    transitionContext.completeTransition(true)
                    copyUIView.removeFromSuperview()
                    fromViewController.view.alpha = 1
            }
            
        } else {
            var window = UIApplication.sharedApplication().keyWindow
            var copyUIView = UIView(frame: CGRect(x: 0, y: 56, width: 320, height: 62))
            copyUIView.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
            
            if (editingFrame == 1) {
                var nameTitleLabelCopy = UILabel(frame: nameTitleLabel.frame)
                nameTitleLabelCopy.text = "Name"
                nameTitleLabelCopy.textColor = UIColor(red: 50/255, green: 82/255, blue: 110/255, alpha: 1.0)
                nameTitleLabelCopy.font = UIFont.systemFontOfSize(10.0)
                
                var nameLabelCopy = UILabel(frame: nameLabel.frame)
                nameLabelCopy.text = nameLabel.text
                nameLabelCopy.font = nameLabel.font
                nameLabelCopy.textColor = UIColor(white: 0.4, alpha: 1.0)
                
                copyUIView.addSubview(nameTitleLabelCopy)
                copyUIView.addSubview(nameLabelCopy)
                
            } else if (editingFrame == 2) {
                var locationTitleLabelCopy = UILabel(frame: locationTitleLabel.frame)
                locationTitleLabelCopy.text = "Location"
                locationTitleLabelCopy.textColor = UIColor(red: 50/255, green: 82/255, blue: 110/255, alpha: 1.0)
                locationTitleLabelCopy.font = UIFont.systemFontOfSize(10.0)
                
                var locationLabelCopy = UILabel(frame: locationLabel.frame)
                locationLabelCopy.text = locationLabel.text
                locationLabelCopy.font = locationLabel.font
                locationLabelCopy.textColor = UIColor(white: 0.4, alpha: 1.0)
                
                copyUIView.addSubview(locationTitleLabelCopy)
                copyUIView.addSubview(locationLabelCopy)
                
            } else if (editingFrame == 3) {
                var dayTitleLabelCopy = UILabel(frame: dayTitleLabel.frame)
                dayTitleLabelCopy.text = "Date"
                dayTitleLabelCopy.textColor = dayTitleLabel.textColor
                dayTitleLabelCopy.font = dayTitleLabel.font
                
                var dayLabelCopy = UILabel(frame: dayLabel.frame)
                dayLabelCopy.text = dayLabel.text
                dayLabelCopy.textColor = dayLabel.textColor
                dayLabelCopy.font = dayLabel.font
                
                var timeTitleLabelCopy = UILabel(frame: timeTitleLabel.frame)
                timeTitleLabelCopy.text = "Time"
                timeTitleLabelCopy.textColor = timeTitleLabel.textColor
                timeTitleLabelCopy.font = timeTitleLabel.font
                
                var timeLabelCopy = UILabel(frame: timeLabel.frame)
                timeLabelCopy.text = timeLabel.text
                timeLabelCopy.textColor = timeLabel.textColor
                timeLabelCopy.font = timeLabel.font
                
                copyUIView.addSubview(dayLabelCopy)
                copyUIView.addSubview(dayTitleLabelCopy)
                copyUIView.addSubview(timeLabelCopy)
                copyUIView.addSubview(timeTitleLabelCopy)
            }
            
            window.addSubview(copyUIView)
            toViewController.view.alpha = 0.9
            fromViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                copyUIView.frame = window.convertRect(self.editingView.frame, fromView: self.scrollView)
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    copyUIView.removeFromSuperview()
                    toViewController.view.alpha = 1.0
                    self.editingFrame = 0
                    self.checkStyles()
            }
        }
    }
    
    func checkStyles() {
        if (nameLabel.text != "Enter event name") {
            nameLabel.textColor = UIColor(white: 0.2, alpha: 1.0)
        }
        
        if (locationLabel.text != "Search event location") {
            locationLabel.textColor = UIColor(white: 0.2, alpha: 1.0)
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    //ADDING CONTACTS
    @IBAction func onAddGuestsButton(sender: AnyObject) {

        showInvitedView += 1

    }

    //DELAY FUNCTION
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }





}
