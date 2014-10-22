//
//  CreateEventViewController.swift
//  Group Project
//
//  Created by Hana Kim on 9/30/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning, EditNameViewControllerDelegate, EditLocationViewControllerDelegate  {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameUIView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationUIView: UIView!
    @IBOutlet weak var dateTimeUIView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var guestsUIView: UIView!
    @IBOutlet weak var addGuestsButton: UIButton!
    @IBOutlet weak var suppliesUIView: UIView!
    @IBOutlet weak var addSuppliesButton: UIButton!
    
    var isPresenting: Bool = true
    var editingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        println("asdfds")
        locationLabel.text = location
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
            
            editingView = nameUIView
            
        case "addLocationSegue":
            var destinationViewController = segue.destinationViewController as EditLocationViewController
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationViewController.transitioningDelegate = self
            editingView = locationUIView
        case "addDateTimeSegue":
            var destinationViewController = segue.destinationViewController as EditDateTimeViewController
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationViewController.transitioningDelegate = self
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
            copyUIView.backgroundColor = UIColor(red: 255/255, green: 136/255, blue: 77/255, alpha: 0.05)

        
            
        /*  
            ADDING Text during transition
            var textFrame = window.convertRect(editingView.frame, fromView: editingView)
            var textLabel = UILabel(frame: textFrame)
            textLabel.text = editingValue[0]
         */
            
            window.addSubview(copyUIView)
            window.backgroundColor = UIColor(white: 0.0, alpha: 1)
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                copyUIView.frame.size.width = 320
                copyUIView.frame.size.height = 62
                copyUIView.frame.origin = CGPoint(x: 0, y: 56)
                copyUIView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
                toViewController.view.alpha = 1

                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    copyUIView.removeFromSuperview()
            }
            
        } else {
            var window = UIApplication.sharedApplication().keyWindow
            var copyUIView = UIView(frame: CGRect(x: 0, y: 56, width: 320, height: 62))
            copyUIView.backgroundColor = UIColor(red: 255/255, green: 136/255, blue: 77/255, alpha: 0.05)

            
            window.addSubview(copyUIView)
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                copyUIView.frame = window.convertRect(self.editingView.frame, fromView: self.scrollView)
                copyUIView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
                
                fromViewController.view.alpha = 0

                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    copyUIView.removeFromSuperview()
                    self.checkStyles()
            }
        }
    }
    
    func checkStyles() {
        if (nameLabel.text != "Enter event name") {
            nameLabel.textColor = UIColor(white: 0.2, alpha: 1.0)
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
}
