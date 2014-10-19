//
//  CreateEventViewController.swift
//  Group Project
//
//  Created by Hana Kim on 9/30/14.
//  Copyright (c) 2014 Hana-Ida-Jessica. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CreateEventViewController: UIViewController, CLLocationManagerDelegate, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning  {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var copyButton: UIButton!
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
    var editingValue = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        // functionality I don't think we need for our demo
        copyButton.hidden = true
        

    }
    
    
    @IBAction func onTapForEdit(sender: AnyObject) {
        performSegueWithIdentifier("editNameSegue", sender: self)
    }
    
    

    @IBAction func onTapBackground(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @IBAction func onTapBackButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        switch segue.identifier {
        case "editNameSegue":
            var destinationViewController = segue.destinationViewController as EditNameViewController
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationViewController.transitioningDelegate = self
            editingView = nameUIView
            editingValue.append(nameLabel.text!)
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
            
        /*    var textFrame = window.convertRect(editingView.frame, fromView: editingView)
            var textLabel = UILabel(frame: textFrame)
            textLabel.text = editingValue[0]
         */
            
         //   copyImageView.image = clickedImage.image
            
            window.addSubview(copyUIView)
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                copyUIView.frame.size.width = 320
                copyUIView.frame.size.height = 62
                copyUIView.frame.origin = CGPoint(x: 0.0, y: 63.0)
                
                toViewController.view.alpha = 1
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    copyUIView.removeFromSuperview()
            }
            
        }/* else {
            var window = UIApplication.sharedApplication().keyWindow
            var photoViewController = fromViewController as PhotoViewController
            var copyImageView: UIImageView!
            var toFrame: CGRect!
            switch photoViewController.whichImage {
            case 0:
                copyImageView = UIImageView(image: imageOne.image)
                toFrame = imageOne.frame
            case 1:
                copyImageView = UIImageView(image: imageTwo.image)
                toFrame = imageTwo.frame
            case 2:
                copyImageView = UIImageView(image: imageThree.image)
                toFrame = imageThree.frame
            case 3:
                copyImageView = UIImageView(image: imageFour.image)
                toFrame = imageFour.frame
            case 4:
                copyImageView = UIImageView(image: imageFive.image)
                toFrame = imageFive.frame
            default:
                copyImageView = UIImageView(image: clickedImage.image)
                println("there is an error... unexpected image number")
            }
            copyImageView.contentMode = UIViewContentMode.ScaleAspectFill
            copyImageView.clipsToBounds = true
            
            copyImageView.frame.size.width = 320
            copyImageView.frame.size.height = 320 * (copyImageView.image!.size.height / copyImageView.image!.size.width)
            copyImageView.center.y = window.center.y - photoViewController.scrollOffset
            window.addSubview(copyImageView)
            
            fromViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                copyImageView.frame = window.convertRect(toFrame, fromView: self.scrollView)
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    copyImageView.removeFromSuperview()
            }
        }*/
    }
    
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    
    
    
    
    
    
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
